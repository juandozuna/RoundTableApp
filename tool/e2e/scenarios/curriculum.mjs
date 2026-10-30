// Scenario — curriculum administration and content languages (ADR 0017): a platform admin uploads
// the curriculum with a preview, edits text, adds a language, uploads and edits its text; a member
// sees the translated text, and the Spanish text where nothing is translated; roles on the API.
import { readFileSync } from 'node:fs';
import { App, check, sleep } from '../lib.mjs';
import { resetDemoSession, sql } from '../flows.mjs';
import { adminAs } from './schedule.mjs';

const example = JSON.parse(readFileSync(new URL('../../../supabase/curriculum/curriculum.example.json', import.meta.url), 'utf8'));
const audit = (event) => Number(sql(`select count(*) from audit_events where event_type = '${event}'`));
const valueName = (n) => sql(`select name from curriculum_values where sequence = ${n}`);

/** Pastes text into a Flutter text field at once (typing 30 KB key by key would take minutes). */
async function paste(app, label, text) {
  await app.waitFor(label, { timeout: 15_000 });
  const field = (await app.nodes()).find((n) => n.hasInput && (typeof label === 'string' ? n.text.includes(label) : label.test(n.text)));
  await app.page.mouse.click(field.x + field.w / 2, field.y + field.h / 2);
  await sleep(300);
  await app.page.keyboard.sendCharacter(text);
  await sleep(600);
}

export async function curriculum(browser) {
  resetDemoSession();
  // A clean slate for the languages (the scenario can be repeated without a reset).
  sql("delete from curriculum_translations; delete from content_locales where not is_default");
  sql("delete from value_questions where question_code = 'e2e_extra'");
  const baseline = JSON.parse(JSON.stringify(example));
  sql(`update curriculum_values set name = '${example.modules[0].values[0].name}' where sequence = 1`);
  const original = valueName(1);

  // ── Roles on the API ──
  for (const account of ['coord@dev.local', 'facil@dev.local', 'ana@dev.local']) {
    const read = await adminAs(account, 'GET', 'curriculum');
    check(`API: ${account} cannot open the curriculum admin API`, read.status === 403 && read.code === 'forbidden', JSON.stringify(read.json));
  }
  const upload = await adminAs('coord@dev.local', 'POST', 'curriculum/import', { curriculum: baseline, dry_run: true });
  check('API: a coordinator cannot upload', upload.status === 403, JSON.stringify(upload.json));

  const admin = await App.open(browser, 'admin-curriculo');
  try {
    await admin.devSignIn('admin');
    check('admin: sees Currículo in the navigation', await admin.seen('Currículo', 15_000));
    await admin.click('Currículo', { role: 'button' });
    check('admin: the curriculum lists the modules, the base language and the actions',
      (await admin.seen('Módulo 1 · Carácter', 20_000)) && await admin.has('Español (base)') && await admin.has('Subir currículo') && await admin.has('Agregar idioma'),
      (await admin.text()).slice(0, 500));
    await admin.shot('h-01-curriculum');

    // ── Upload with preview (Spanish) ──
    const edited = JSON.parse(JSON.stringify(example));
    edited.modules[0].values[0].name = 'Integridad E2E';
    edited.modules[0].values[1].questions.push({ code: 'e2e_extra', text: '¿Qué cambió esta semana?', responseType: 'text' });
    await admin.click('Subir currículo', { role: 'button' });
    await admin.waitFor('Revisar cambios');
    await paste(admin, 'Contenido del archivo', JSON.stringify(edited));
    await admin.click('Revisar cambios', { role: 'button' });
    check('upload: the preview shows what changes before anything is saved',
      (await admin.seen('Cambios que se aplicarían', 20_000)) && await admin.has('1 nuevos') && await admin.has('1 con cambios') && await admin.has('Nombre: Integridad → Integridad E2E'),
      (await admin.text()).slice(0, 800));
    check('upload: nothing was written by the preview', valueName(1) === original);
    await admin.shot('h-02-upload-preview');
    const imports = audit('curriculum.imported');
    await admin.click('Aplicar cambios', { role: 'button' });
    check('upload: applying confirms and returns to the curriculum', await admin.seen('Currículo actualizado.', 15_000) && await admin.seen('Módulo 1 · Carácter', 15_000));
    check('server: value renamed and question added with stable ids',
      valueName(1) === 'Integridad E2E' && sql("select count(*) from value_questions where question_code = 'e2e_extra' and id = md5('gold-roundtables:question:2:e2e_extra')::uuid") === '1');
    check('server: the upload is audit-logged once', audit('curriculum.imported') === imports + 1);

    // Same file again: idempotent.
    await admin.click('Subir currículo', { role: 'button' });
    await admin.waitFor('Revisar cambios');
    await paste(admin, 'Contenido del archivo', JSON.stringify(edited));
    await admin.click('Revisar cambios', { role: 'button' });
    check('upload: the same file again has no changes', await admin.seen('No hay cambios', 20_000));
    check('upload: and offers nothing to apply', !(await admin.has('Aplicar cambios')));
    await admin.click('Cancelar', { role: 'button' });
    await sleep(1500);
    await admin.goto('/#/admin/curriculo');
    await admin.waitFor('Módulo 1 · Carácter');

    // A partial file is refused whole.
    const partial = JSON.parse(JSON.stringify(example));
    partial.modules.pop();
    const refusedFile = await adminAs('admin@dev.local', 'POST', 'curriculum/import', { curriculum: partial });
    check('API: a file with 4 modules is refused', refusedFile.status === 422 && refusedFile.code === 'curriculum_invalid', JSON.stringify(refusedFile.json));

    // An answered question's type cannot change: the preview says so, applying is refused.
    const answered = sql("select cv.sequence || '/' || q.question_code || '/' || q.response_type from member_answers a join value_questions q on q.id = a.question_id join curriculum_values cv on cv.id = q.value_id limit 1");
    const [seq, code, type] = answered.split('/');
    const locked = JSON.parse(JSON.stringify(edited));
    const lockedValue = locked.modules.flatMap((m) => m.values).find((v) => String(v.number) === seq);
    lockedValue.questions.find((q) => q.code === code).responseType = type === 'text' ? 'person' : 'text';
    const lockedPreview = await adminAs('admin@dev.local', 'POST', 'curriculum/import', { curriculum: locked, dry_run: true });
    check('API: changing the answer type of an answered question is flagged in the preview', lockedPreview.status === 200 && lockedPreview.json.refused?.length === 1, JSON.stringify(lockedPreview.json));
    const lockedApply = await adminAs('admin@dev.local', 'POST', 'curriculum/import', { curriculum: locked });
    check('API: and refused when applied (nothing written)', lockedApply.status === 409 && lockedApply.code === 'curriculum_locked', JSON.stringify(lockedApply.json));

    // CSV works too.
    const csv = 'kind,module,value,code,name,description,booklet_reference,text,response_type\nvalue,1,1,,Integridad E2E,,,,';
    const csvPreview = await adminAs('admin@dev.local', 'POST', 'curriculum/locales/en/import', { csv, dry_run: true });
    check('API: translations are refused for a language that does not exist yet', csvPreview.status === 404 && csvPreview.code === 'locale_not_found', JSON.stringify(csvPreview.json));

    // ── Edit text in the UI ──
    await admin.click('Módulo 1 · Carácter');
    await admin.click('Editar valor 1', { role: 'button' });
    await admin.fill('Nombre *', 'Integridad editada');
    await admin.click('Guardar', { role: 'button', last: true });
    check('edit: the value text is saved', await admin.seen('Cambios guardados.', 15_000) && valueName(1) === 'Integridad editada', valueName(1));
    check('edit: the new text is shown', await admin.seen('1. Integridad editada', 15_000));
    check('server: the edit is audit-logged', audit('curriculum.edited') >= 1);
    await admin.shot('h-03-edit');

    // ── Add a language ──
    await admin.click('Agregar idioma', { role: 'button' });
    await admin.fill('Nombre del idioma *', 'English');
    await admin.fill('Código del idioma *', 'en');
    await admin.click('Agregar', { role: 'button', last: true });
    check('language: added, and its completeness starts at zero',
      (await admin.seen(/English: 0 de \d+ textos traducidos \(0 %\)/, 20_000)) && sql("select count(*) from content_locales where code = 'en'") === '1',
      (await admin.text()).slice(0, 500));
    await admin.shot('h-04-language-added');

    // ── Upload that language's text ──
    const pendingValue = sql("select cv.sequence from sessions s join curriculum_values cv on cv.id = s.value_id where s.round_table_id = (select id from round_tables where code = 'LUZ-03') and s.status in ('scheduled','open')");
    const translation = {
      locale: 'en',
      modules: [{ number: 1, name: 'Character', values: [{ number: Number(pendingValue), name: 'E2E Responsibility', questions: [{ code: example.modules[0].values[0].questions[0].code, text: 'Why did you give yourself that score?' }] }] }],
    };
    await admin.click('Subir traducción (English)', { role: 'button' });
    await admin.waitFor('Revisar cambios');
    await paste(admin, 'Contenido del archivo', JSON.stringify(translation));
    await admin.click('Revisar cambios', { role: 'button' });
    check('translation: the preview lists the new texts', (await admin.seen('3 nuevos', 20_000)) && sql("select count(*) from curriculum_translations") === '0', (await admin.text()).slice(0, 600));
    await admin.click('Aplicar cambios', { role: 'button' });
    check('translation: applied, and the completeness grows', (await admin.seen('Currículo actualizado.', 15_000)) && await admin.seen(/English: 3 de \d+ textos traducidos/, 15_000), (await admin.text()).split('\n').filter((l) => /English|Módulo|traduc/.test(l)).join(' | '));
    check('server: translations stored per locale; the Spanish text is untouched',
      sql("select count(*) from curriculum_translations where locale = 'en'") === '3' && valueName(4) === 'Responsabilidad',
      sql('select entity_type, name from curriculum_translations'));
    await admin.shot('h-05-translation');

    // ── Edit one translated text in the UI ──
    await admin.click('Módulo 1 · Character').catch(() => {});
    const valueNumber = Number(pendingValue);
    if (valueNumber <= 10) {
      await admin.click(`Editar valor ${valueNumber}`, { role: 'button' });
      await admin.fill(/Nombre/, 'E2E Responsibility!');
      await admin.click('Guardar', { role: 'button', last: true });
      check('translation: a single text is edited in the UI', await admin.seen('Cambios guardados.', 15_000)
        && sql(`select name from curriculum_translations where entity_id = md5('gold-roundtables:value:${valueNumber}')::uuid`) === 'E2E Responsibility!');
    }
    await admin.shot('h-06-translation-edit');
  } finally {
    await admin.close();
  }

  // ── A member sees the translated text, and Spanish where nothing is translated ──
  sql(`update curriculum_translations set name = 'E2E Responsibility' where entity_type = 'value'`);
  const member = await App.open(browser, 'miembro-idioma');
  try {
    await member.devSignIn('ana');
    check('member: Home shows the translated value (the device language is English)', await member.seen(/Valor 4 · E2E Responsibility/, 40_000), (await member.text()).slice(0, 600));
    check('member: the untranslated follow-up value stays in Spanish', await member.has('Seguimiento de: Honestidad'), (await member.text()).slice(0, 600));
    await member.shot('h-07-member-english');
    await member.click('Ajustes', { role: 'button' });
    check('member: Settings offers the content language once there are two', (await member.seen('IDIOMA DEL CONTENIDO', 10_000)) || (await member.has('Idioma del contenido')));
    await member.click('Español', { role: 'button' });
    await member.click('Inicio', { role: 'button' });
    check('member: choosing Español shows the Spanish value again', await member.seen(/Valor 4 · Responsabilidad/, 20_000), (await member.text()).slice(0, 600));
    await member.shot('h-08-member-spanish');
    await member.click('Ajustes', { role: 'button' });
    await member.click('English', { role: 'button' });
    await member.click('Inicio', { role: 'button' });
    check('member: switching back to English shows the English texts again', await member.seen(/Valor 4 · E2E Responsibility/, 20_000));
  } finally {
    await member.close();
  }

  // A translation added later reaches the device without a release; clean up.
  sql("delete from curriculum_translations; delete from content_locales where not is_default");
  sql(`update curriculum_values set name = ${`'${original.replaceAll("'", "''")}'`} where sequence = 1`);
  sql("delete from value_questions where question_code = 'e2e_extra'");
}
