-- Curriculum administration and content languages (ADR 0017): permissions, RLS, atomic and
-- idempotent upload with preview, protection of answered questions, translations.
begin;
create extension if not exists pgtap with schema extensions;
select plan(59);

create function pg_temp.u(p text) returns uuid language sql immutable as
  $$ select md5('gold-roundtables:user:' || p)::uuid $$;
create function pg_temp.id(p text) returns uuid language sql immutable as
  $$ select md5('gold-roundtables:' || p)::uuid $$;
-- Returns the error code raised by a statement (NULL when it succeeds).
create function pg_temp.err(p_sql text) returns text language plpgsql as $$
begin
  execute p_sql;
  return null;
exception when others then
  return sqlerrm;
end;
$$;
grant execute on function pg_temp.err(text) to authenticated;
create function pg_temp.act_as(p_user text) returns void language sql as $$
  select set_config('request.jwt.claims',
    json_build_object('sub', pg_temp.u(p_user), 'role', 'authenticated')::text, true);
$$;
grant execute on function pg_temp.act_as(text) to authenticated;

-- The stored curriculum, in the upload file format.
create function pg_temp.export() returns jsonb language sql as $$
  select jsonb_build_object('modules', jsonb_agg(jsonb_build_object(
    'number', m.number, 'name', m.name, 'description', m.description,
    'values', (select jsonb_agg(jsonb_build_object(
        'number', v.sequence, 'name', v.name, 'description', v.description,
        'bookletReference', v.booklet_reference,
        'questions', (select jsonb_agg(jsonb_build_object(
            'code', q.question_code, 'text', q.question_text, 'responseType', q.response_type)
            order by q.sort_order)
          from public.value_questions q where q.value_id = v.id and q.status = 'active')
      ) order by v.sequence)
      from public.curriculum_values v where v.module_id = m.id)
  ) order by m.number))
  from public.curriculum_modules m
$$;
create function pg_temp.import(p_data jsonb, p_dry boolean) returns jsonb language sql as $$
  select api.curriculum_import(pg_temp.u('admin'), jsonb_build_object('curriculum', p_data, 'dry_run', p_dry))
$$;
create function pg_temp.vname(p_seq int) returns text language sql as $$
  select name from public.curriculum_values where sequence = p_seq
$$;

-- ── Permissions ──────────────────────────────────────────────────────────────────────────
select is(pg_temp.err($$select api.curriculum_get(md5('gold-roundtables:user:coord')::uuid, '{}')$$),
          'forbidden', 'a coordinator cannot read the curriculum admin API');
select is(pg_temp.err($$select api.curriculum_import(md5('gold-roundtables:user:facil')::uuid, '{"curriculum":{}}')$$),
          'forbidden', 'a facilitator cannot upload');
select is(pg_temp.err($$select api.curriculum_edit(md5('gold-roundtables:user:ana')::uuid, '{}')$$),
          'forbidden', 'a member cannot edit');
select is(pg_temp.err($$select api.content_locale_add(md5('gold-roundtables:user:coord')::uuid, '{"code":"en","name":"English"}')$$),
          'forbidden', 'a coordinator cannot add a language');
select is(pg_temp.err($$select api.curriculum_import(null, '{}')$$), 'forbidden', 'no caller, no access');

-- ── RLS: read-only for everyone signed in ────────────────────────────────────────────────
select pg_temp.act_as('ana');
set local role authenticated;
select is((select count(*)::int from public.content_locales), 1, 'a member reads the content languages');
select is(pg_temp.err($$insert into public.content_locales (code, name) values ('en', 'English')$$),
          'permission denied for table content_locales', 'a member cannot add a language directly');
select is(pg_temp.err($$delete from public.curriculum_translations$$),
          'permission denied for table curriculum_translations', 'a member cannot delete translations');
select is(pg_temp.err($$update public.curriculum_modules set name = 'x'$$) is null, false,
          'a member cannot edit the curriculum directly');
reset role;

-- ── Idempotent upload ────────────────────────────────────────────────────────────────────
create temp table t_start as select now() as at;
select is(jsonb_array_length(pg_temp.import(pg_temp.export(), true)->'changes'), 0,
          'the stored curriculum as a file has no changes (preview)');
select is((pg_temp.import(pg_temp.export(), false)->>'applied')::boolean, false,
          're-uploading the same file applies nothing');
select is((select count(*)::int from public.curriculum_values where updated_at > (select at from t_start)), 0,
          'and does not touch any row (devices are not woken up for nothing)');

-- ── Preview then apply ───────────────────────────────────────────────────────────────────
create temp table t_file as select pg_temp.export() as j;
-- value 1 renamed, value 2 gains a question, value 3 drops its first question.
update t_file set j = jsonb_set(j, '{modules,0,values,0,name}', '"Integridad total"');
update t_file set j = jsonb_set(j, '{modules,0,values,1,questions}',
  (j #> '{modules,0,values,1,questions}') || '[{"code":"nueva","text":"¿Qué cambió?","responseType":"text"}]'::jsonb);
update t_file set j = j #- '{modules,0,values,2,questions,0}';
create temp table t_preview as select pg_temp.import((select j from t_file), true) as r;
select is(jsonb_array_length((select r->'changes' from t_preview)), 4,
          'the preview lists the rename, the new question, the dropped one and the re-ordered survivor');
select is((select string_agg(distinct c->>'action', ',' order by c->>'action') from t_preview, jsonb_array_elements(r->'changes') c),
          'create,deactivate,update', 'with create / update / deactivate actions');
select is(pg_temp.vname(1), 'Integridad', 'the preview wrote nothing');
create temp table t_applied as select pg_temp.import((select j from t_file), false) as r;
select is((select (r->>'applied')::boolean from t_applied), true, 'the apply reports it applied');
select is(pg_temp.vname(1), 'Integridad total', 'the rename is stored');
select is((select status::text from public.value_questions
           where id = pg_temp.id('question:2:nueva')), 'active', 'the new question has the stable id scheme');
select is((select count(*)::int from public.value_questions where value_id = pg_temp.id('value:3') and status = 'inactive'), 1,
          'the dropped question is deactivated, not deleted');
select is(jsonb_array_length(pg_temp.import((select j from t_file), true)->'changes'), 0,
          'applying the same file again is a no-op');
-- A question that returns is reactivated.
select is((select c->>'action' from jsonb_array_elements(pg_temp.import(pg_temp.export() || '{}', true)->'changes') c limit 1),
          null, 'export of the new state is stable');
update t_file set j = pg_temp.export();
update t_file set j = jsonb_set(j, '{modules,0,values,2,questions}',
  (select jsonb_agg(x) from (
     select jsonb_build_object('code', q.question_code, 'text', q.question_text, 'responseType', q.response_type) x
     from public.value_questions q where q.value_id = pg_temp.id('value:3') order by q.sort_order) s));
select is((select c->>'action' from jsonb_array_elements(pg_temp.import((select j from t_file), true)->'changes') c limit 1),
          'reactivate', 'a returning question is reactivated');

-- ── Invalid files are refused whole ──────────────────────────────────────────────────────
select is(pg_temp.err($$select api.curriculum_import(md5('gold-roundtables:user:admin')::uuid,
            jsonb_build_object('curriculum', jsonb_build_object('modules', '[]'::jsonb)))$$),
          'curriculum_invalid', 'a partial file (no modules) is refused');
update t_file set j = pg_temp.export();
update t_file set j = j #- '{modules,4,values,7}';
select is(pg_temp.err('select pg_temp.import((select j from t_file), false)'), 'curriculum_invalid',
          'a file with 47 values is refused');
update t_file set j = jsonb_set(pg_temp.export(), '{modules,1,values,0,number}', '99');
select is(pg_temp.err('select pg_temp.import((select j from t_file), false)'), 'curriculum_invalid',
          'a file that breaks the 1–48 numbering is refused');
update t_file set j = jsonb_set(pg_temp.export(), '{modules,0,values,0,questions,0,code}', '"Bad Code"');
select is(pg_temp.err('select pg_temp.import((select j from t_file), false)'), 'curriculum_invalid',
          'a question code outside [a-z0-9_] is refused');

-- ── Answered questions and structure are protected; refusals are atomic ───────────────────
create temp table t_answered as
select q.id, q.question_code as code, cv.sequence as seq, q.response_type
from public.value_questions q
join public.curriculum_values cv on cv.id = q.value_id
where exists (select 1 from public.member_answers a where a.question_id = q.id) and q.status = 'active'
order by cv.sequence, q.sort_order limit 1;
create function pg_temp.set_type(p_data jsonb, p_seq int, p_code text, p_type text) returns jsonb language plpgsql as $$
declare v_m int; v_v int; v_q int;
begin
  v_m := case when p_seq <= 10 then 0 when p_seq <= 20 then 1 when p_seq <= 30 then 2 when p_seq <= 40 then 3 else 4 end;
  v_v := p_seq - 1 - (case v_m when 0 then 0 when 1 then 10 when 2 then 20 when 3 then 30 else 40 end);
  select (e.i - 1)::int into v_q
  from jsonb_array_elements(p_data #> array['modules', v_m::text, 'values', v_v::text, 'questions'])
       with ordinality as e(v, i)
  where e.v ->> 'code' = p_code;
  return jsonb_set(p_data, array['modules', v_m::text, 'values', v_v::text, 'questions', v_q::text, 'responseType'],
                   to_jsonb(p_type));
end;
$$;
update t_file set j = pg_temp.set_type(pg_temp.export(), (select seq from t_answered), (select code from t_answered),
  case (select response_type from t_answered) when 'text' then 'person' else 'text' end);
update t_file set j = jsonb_set(j, '{modules,3,values,0,name}', '"Cambio atómico"');
select is(jsonb_array_length(pg_temp.import((select j from t_file), true)->'refused'), 1,
          'the preview refuses changing the answer type of an answered question');
select is(pg_temp.err('select pg_temp.import((select j from t_file), false)'), 'curriculum_locked',
          'applying it is refused');
select is(pg_temp.vname(31), (select name from public.curriculum_values where sequence = 31),
          'a refusal applies nothing: the other edits in the same file are not applied either');
select is((select response_type from public.value_questions where id = (select id from t_answered)),
          (select response_type from t_answered), 'the answered question keeps its type');

-- ── Edits ────────────────────────────────────────────────────────────────────────────────
select is((api.curriculum_edit(pg_temp.u('admin'), jsonb_build_object('entity', 'module',
             'id', pg_temp.id('module:1'), 'name', 'Carácter y fe')) ->> 'changed')::boolean, true,
          'the base text of a module is edited');
select is((api.curriculum_edit(pg_temp.u('admin'), jsonb_build_object('entity', 'module',
             'id', pg_temp.id('module:1'), 'name', 'Carácter y fe')) ->> 'changed')::boolean, false,
          'the same edit again changes nothing');
select is(pg_temp.err(format($$select api.curriculum_edit(%L, jsonb_build_object('entity', 'value', 'id', %L, 'name', '  '))$$,
            pg_temp.u('admin'), pg_temp.id('value:1'))), 'curriculum_invalid', 'an empty name is refused');
select is(pg_temp.err(format($$select api.curriculum_edit(%L, jsonb_build_object('entity', 'question', 'id', %L, 'response_type', %L))$$,
            pg_temp.u('admin'), (select id from t_answered),
            case (select response_type from t_answered) when 'text' then 'person' else 'text' end)),
          'question_type_locked', 'the answer type of an answered question cannot change');
select is((api.curriculum_edit(pg_temp.u('admin'), jsonb_build_object('entity', 'question', 'id', (select id from t_answered),
             'text', 'Texto corregido')) ->> 'changed')::boolean, true, 'but its text can');
select is(pg_temp.err(format($$select api.curriculum_edit(%L, jsonb_build_object('entity', 'question', 'id', %L, 'status', 'inactive'))$$,
            pg_temp.u('admin'), pg_temp.id('question:5:' || (select question_code from public.value_questions
              where value_id = pg_temp.id('value:5') order by sort_order limit 1)))) is null, true,
          'a question can be deactivated while others stay active');
create temp table t_added as
select api.curriculum_question_create(pg_temp.u('admin'), jsonb_build_object(
  'value_id', pg_temp.id('value:6'), 'code', 'extra', 'text', '¿Y ahora?', 'response_type', 'person')) as j;
select is((select question_text || '/' || response_type from public.value_questions where id = ((select j->>'id' from t_added))::uuid),
          '¿Y ahora?/person', 'a question is added');
select is(pg_temp.err(format($$select api.curriculum_question_create(%L, jsonb_build_object('value_id', %L, 'code', 'extra', 'text', 'x'))$$,
            pg_temp.u('admin'), pg_temp.id('value:6'))), 'duplicate_question', 'a duplicate active code is refused');

-- ── Languages and translations ───────────────────────────────────────────────────────────
select is(api.content_locale_add(pg_temp.u('admin'), '{"code":"EN","name":"English"}')->>'code', 'en',
          'a language is added (code lower-cased)');
select is(pg_temp.err($$select api.content_locale_add(md5('gold-roundtables:user:admin')::uuid, '{"code":"en","name":"English"}')$$),
          'duplicate_locale', 'a duplicate language is refused');
select ok(pg_temp.err($$select api.content_locale_add(md5('gold-roundtables:user:admin')::uuid, '{"code":"e1","name":"Bad"}')$$) is not null,
          'a malformed language code is refused');
select is(pg_temp.err(format($$select api.curriculum_edit(%L, jsonb_build_object('entity', 'value', 'id', %L, 'locale', 'es', 'name', 'Integridad'))$$,
            pg_temp.u('admin'), pg_temp.id('value:1'))) is null, true,
          'editing the "es" locale edits the base text');
select api.curriculum_edit(pg_temp.u('admin'), jsonb_build_object('entity', 'value', 'id', pg_temp.id('value:1'),
  'locale', 'en', 'name', 'Integrity'));
select is((select name from public.curriculum_translations where locale = 'en' and entity_id = pg_temp.id('value:1')),
          'Integrity', 'a translation is stored per locale');
select is(pg_temp.vname(1), 'Integridad', 'the Spanish base text is untouched');
select is((api.curriculum_get(pg_temp.u('admin'), '{"locale":"en"}') #>> '{modules,0,values,0,translation,name}'),
          'Integrity', 'the admin view returns the language text');
select is((select (l->'completeness'->>'translated')::int from jsonb_array_elements(
             api.curriculum_get(pg_temp.u('admin'), '{}')->'locales') l where l->>'code' = 'en'), 1,
          'completeness counts the translated texts');
-- Partial translation file (JSON shape of the curriculum file), previewed then applied.
create temp table t_tr as select jsonb_build_object('modules', jsonb_build_array(jsonb_build_object(
  'number', 1, 'name', 'Character', 'values', jsonb_build_array(jsonb_build_object(
    'number', 2, 'name', 'Gratitude', 'questions', jsonb_build_array(jsonb_build_object(
      'code', 'nueva', 'text', 'What changed?'))))))) as j;
select is(jsonb_array_length(api.curriculum_translations_import(pg_temp.u('admin'),
            jsonb_build_object('locale', 'en', 'curriculum', (select j from t_tr), 'dry_run', true))->'changes'), 3,
          'the translation preview lists module, value and question');
select is((select count(*)::int from public.curriculum_translations where locale = 'en'), 1, 'the preview wrote nothing');
select api.curriculum_translations_import(pg_temp.u('admin'),
  jsonb_build_object('locale', 'en', 'curriculum', (select j from t_tr)));
select is((select count(*)::int from public.curriculum_translations where locale = 'en'), 4,
          'the apply stores them (the earlier one included)');
select is(jsonb_array_length(api.curriculum_translations_import(pg_temp.u('admin'),
            jsonb_build_object('locale', 'en', 'curriculum', (select j from t_tr)))->'changes'), 0,
          're-uploading the same translations changes nothing');
select is(pg_temp.err($$select api.curriculum_translations_import(md5('gold-roundtables:user:admin')::uuid,
            '{"locale":"en","curriculum":{"modules":[{"number":9,"name":"x"}]}}')$$),
          'curriculum_invalid', 'a translation for a module that does not exist is refused');
select is(pg_temp.err($$select api.curriculum_translations_import(md5('gold-roundtables:user:admin')::uuid,
            '{"locale":"es","curriculum":{"modules":[{"number":1,"name":"x"}]}}')$$),
          'locale_is_default', 'the base language is not uploaded as a translation');
select is(pg_temp.err($$select api.curriculum_translations_import(md5('gold-roundtables:user:admin')::uuid,
            '{"locale":"fr","curriculum":{"modules":[{"number":1,"name":"x"}]}}')$$),
          'locale_not_found', 'an unknown language is refused');
select api.curriculum_edit(pg_temp.u('admin'), jsonb_build_object('entity', 'value', 'id', pg_temp.id('value:1'),
  'locale', 'en', 'name', ''));
select is((select count(*)::int from public.curriculum_translations where entity_id = pg_temp.id('value:1')), 0,
          'clearing every translated field removes the row (falls back to Spanish)');
select is(pg_temp.err($$insert into public.curriculum_translations (locale, entity_type, entity_id, name)
            values ('es', 'module', md5('gold-roundtables:module:1')::uuid, 'x')$$),
          'operation_not_allowed', 'the base language never gets translation rows');
select is(pg_temp.err($$insert into public.curriculum_translations (locale, entity_type, entity_id, name)
            values ('en', 'value', gen_random_uuid(), 'x')$$),
          'invalid_reference', 'a translation must point at an existing item');

-- ── Members receive the translations ─────────────────────────────────────────────────────
select pg_temp.act_as('ana');
set local role authenticated;
select is((select count(*)::int from public.curriculum_translations), 3, 'a member can read the translations (they sync to devices)');
reset role;

-- ── Audit ────────────────────────────────────────────────────────────────────────────────
select ok((select count(distinct event_type) from public.audit_events where event_type like 'curriculum.%') >= 5,
          'imports, edits, translations and languages are audit-logged');
select is((select count(*)::int from public.audit_events where event_type = 'curriculum.imported'), 1,
          'only uploads that changed something are logged (preview, no-op and refused ones are not)');

select * from finish();
rollback;
