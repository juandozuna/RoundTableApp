// Scenario e (admin part) — explorer, saved views, filters, reports, create organization /
// location / table, assign facilitator, 9-seat limit, audit log, reveal answers.
import { App, check, sleep } from '../lib.mjs';
import { openTableFromExplorer, releaseE2eSeats, resetDemoSession, sql } from '../flows.mjs';

export async function admin(browser) {
  resetDemoSession();
  releaseE2eSeats();
  // Unique per run so the scenario can be repeated without resetting the database.
  const letter = () => String.fromCharCode(65 + Math.floor(Math.random() * 26));
  const n = String(10 + Math.floor(Math.random() * 90));
  const code = `${letter()}${letter()}${letter()}-${n}`;
  const name = `Mesa E2E ${code}`;
  const a = await App.open(browser, 'admin');
  try {
    await a.devSignIn('admin');
    await a.click('Mesas', { role: 'button' });
    check('explorer lists the seeded tables', await a.seen(/^Mesas \d+$/, 15_000));
    await a.click('Crear', { role: 'button' });
    await a.click('Crear mesa');
    await a.click('Organización *', { role: 'button' });
    await a.click('Fundación Luz', { role: 'menuitem' });
    await a.fill('Nombre de la mesa *', name);
    await a.fill('Código *', code);
    await a.click('Ubicación *', { role: 'button' });
    await a.click('Sede Central', { role: 'menuitem' });
    await a.click('Día *', { role: 'button' });
    await a.click('Lunes', { role: 'menuitem' });
    await a.click('Hora *', { role: 'button' });
    await a.click('ACEPTAR', { role: 'button' });
    await a.click('Zona horaria *', { role: 'button' });
    await a.click('Santo_Domingo', { role: 'menuitem' });
    await a.click('Facilitador de la mesa *', { role: 'button' });
    const facilitatorName = await a.pickMenuItem(0, { skip: /Asiento|Invitación pendiente/ });
    await a.click('Crear mesa', { role: 'button', last: true });
    check('table created and shown with its detail', await a.seen(`${code} · ${name}`, 15_000), (await a.text()).slice(0, 400));
    check('server: table exists with a facilitator', Number(sql(`select count(*) from round_tables t join table_members m on m.round_table_id = t.id and m.role = 'facilitator' where t.code = '${code}'`)) === 1);
    await a.shot('e-01-table-created');
    check('new table with only its facilitator shows the "needs 3 to 9 people" warning', await a.has('Faltan 2 personas'));

    // 9-seat limit on Mesa Esperanza 03 (8/9): the first invitation fits, the second is refused.
    await a.click('Volver', { role: 'button' });
    await openTableFromExplorer(a, 'Esperanza');
    await a.click('Agregar miembro', { role: 'button' });
    await a.click('Invitar a una persona nueva', { role: 'button' });
    await a.fill('Nombre *', 'Noveno');
    await a.fill('Apellido *', 'Asiento');
    await a.fill('Correo *', `noveno.${n}@e2e.local`);
    await a.click('Crear e invitar', { role: 'button' });
    check('9th seat: invitation created', await a.seen('Invitación creada para Noveno Asiento', 15_000));
    await a.shot('e-02-ninth-seat');
    await a.click('Invitar a otra persona', { role: 'button' });
    await sleep(1000);
    await a.fill('Nombre *', 'Décimo');
    await a.fill('Apellido *', 'Asiento');
    await a.fill('Correo *', `decimo.${n}@e2e.local`);
    await a.click('Crear e invitar', { role: 'button' });
    check('10th seat is refused: the table already has 9 people', await a.seen('La mesa ya tiene 9 personas (incluido el facilitador). No se puede agregar otra.', 15_000));
    await a.shot('e-03-tenth-seat');
    await a.click('Cancelar', { role: 'button' });
    await sleep(1500);
    check('table detail shows the table is full (9/9)', await a.seen('Mesa llena (9/9)', 10_000));

    // Reveal a member's answers: a sensitive view that is audited.
    await a.click('Ver respuestas de Ana Lucía Méndez', { role: 'button' });
    await sleep(1500);
    check('answers are masked until revealed', await a.has('••'));
    const revealEvents = () => Number(sql("select count(*) from audit_events where event_type like 'answers.%' or event_type like '%reveal%' or event_type like '%sensitive%'"));
    const before = revealEvents();
    await a.click('Mostrar respuestas', { role: 'button' });
    await sleep(2500);
    check('revealed answers show real scores', !(await a.has('••')), (await a.text()).slice(0, 300));
    await a.shot('e-04-reveal');
    check('server: the reveal was recorded in the audit log', revealEvents() === before + 1, sql('select distinct event_type from audit_events order by 1').replace(/\n/g, ', '));
    await a.click('Volver', { role: 'button' });
    await a.click('Volver', { role: 'button' });

    // Change the facilitator of the table created above.
    await a.waitFor(/^Mesas \d+$/);
    await openTableFromExplorer(a, code, `${code} · ${name}`);
    await a.click('Cambiar facilitador', { role: 'button' });
    await sleep(1500);
    const facilitatorBefore = sql(`select p.id from table_members m join people p on p.id = m.person_id join round_tables t on t.id = m.round_table_id where t.code = '${code}' and m.role = 'facilitator' and m.status = 'active'`);
    await a.click('Nuevo facilitador *', { role: 'button' });
    const newFacilitator = await a.pickMenuItem(1, { skip: /Asiento|Invitación pendiente/ });
    await a.shot('e-04-change-facilitator');
    await a.click('Confirmar', { role: 'button' });
    await sleep(2500);
    const facilitatorAfter = sql(`select p.id from table_members m join people p on p.id = m.person_id join round_tables t on t.id = m.round_table_id where t.code = '${code}' and m.role = 'facilitator' and m.status = 'active'`);
    check('server: the table has exactly one (new) facilitator after the change', facilitatorAfter !== '' && !facilitatorAfter.includes('\n') && facilitatorAfter !== facilitatorBefore, `${facilitatorBefore} → ${facilitatorAfter} (${newFacilitator})`);
    check('table detail shows the new facilitator', await a.seen(newFacilitator, 10_000));

    // Organization → location → table, from the explorer.
    await a.click('Volver', { role: 'button' });
    await a.click('Crear', { role: 'button' });
    await a.click('Crear organización');
    const orgName = `Org E2E ${n}`;
    await a.fill('Nombre *', orgName);
    await a.click('País *', { role: 'button' });
    await a.click('Colombia', { role: 'menuitem' });
    await a.fill('Región / ciudad', 'Cali');
    await a.fill('Nombre completo *', 'Pedro Prueba');
    await a.fill('Correo *', `coordinador.${n}@e2e.local`);
    await a.click('Crear organización', { role: 'button' });
    check('organization created with an invitation for its coordinator', await a.seen('Invitación creada para Pedro Prueba', 15_000));
    check('server: organization exists', Number(sql(`select count(*) from organizations where name = '${orgName}'`)) === 1);
    await a.shot('e-05-organization-created');
    await a.click('Volver al explorador', { role: 'button' });
    await a.click(/^Organizaciones/, { role: 'button' });
    await a.fillNth(0, orgName);
    await sleep(1200);
    await a.click(orgName);
    await a.click('Nueva ubicación', { role: 'button' });
    await a.fill('Nombre de la ubicación *', 'Sede Cali');
    await a.fill('Ciudad', 'Cali');
    await a.click('Crear ubicación', { role: 'button' });
    check('location created in the new organization', await a.seen('Sede Cali', 10_000));
    check('server: location exists', Number(sql(`select count(*) from locations where name = 'Sede Cali' and organization_id = (select id from organizations where name = '${orgName}')`)) === 1);
    await a.shot('e-06-location-created');
  } finally {
    await a.close();
  }
}
