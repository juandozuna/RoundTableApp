-- Curriculum administration and content languages (ADR 0017).
--
-- * content_locales: the languages the curriculum text exists in. 'es' is the base language
--   (the text stored on curriculum_modules / curriculum_values / value_questions) and the
--   fallback for every other language.
-- * curriculum_translations: per-language text of a module, value or question, keyed by
--   (locale, entity_type, entity_id). Absent or blank fields fall back to the Spanish base.
-- * api.curriculum_*: platform-admin operations (upload with preview, edit, add language). Every
--   operation runs in one transaction and writes an audit event. The upload previews and applies
--   through the SAME function (dry run vs. apply), so the preview is exactly what will happen.
-- ---------------------------------------------------------------------------------------------
-- Tables
-- ---------------------------------------------------------------------------------------------
create table public.content_locales (
  id uuid primary key default gen_random_uuid(),
  code text not null unique check (code ~ '^[a-z]{2,3}$'),
  name text not null check (length(btrim(name)) between 2 and 60),
  is_default boolean not null default false,
  status public.record_status not null default 'active',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create unique index content_locales_one_default on public.content_locales ((true)) where is_default;

create table public.curriculum_translations (
  id uuid primary key default gen_random_uuid(),
  locale text not null references public.content_locales (code),
  entity_type text not null check (entity_type in ('module', 'value', 'question')),
  entity_id uuid not null,
  name text,
  description text,
  question_text text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint curriculum_translations_key unique (locale, entity_type, entity_id)
);
create index curriculum_translations_entity_idx on public.curriculum_translations (entity_type, entity_id);

create trigger content_locales_touch before update on public.content_locales
  for each row execute function app.touch_updated_at();
create trigger curriculum_translations_touch before update on public.curriculum_translations
  for each row execute function app.touch_updated_at();

-- The base language is the default content locale and never has translation rows.
insert into public.content_locales (id, code, name, is_default)
values (md5('gold-roundtables:locale:es')::uuid, 'es', 'Español', true);

create or replace function app.check_translation_entity()
returns trigger language plpgsql set search_path = '' as $$
declare
  v_exists boolean;
begin
  if exists (select 1 from public.content_locales where code = new.locale and is_default) then
    perform app.fail('operation_not_allowed', 'El idioma base se edita en el currículo, no como traducción.');
  end if;
  select case new.entity_type
           when 'module' then exists (select 1 from public.curriculum_modules where id = new.entity_id)
           when 'value' then exists (select 1 from public.curriculum_values where id = new.entity_id)
           else exists (select 1 from public.value_questions where id = new.entity_id) end
    into v_exists;
  if not v_exists then
    perform app.fail('invalid_reference', 'La traducción hace referencia a algo que no existe.');
  end if;
  return new;
end;
$$;
create trigger curriculum_translations_entity_check
  before insert or update of locale, entity_type, entity_id on public.curriculum_translations
  for each row execute function app.check_translation_entity();

-- Reference data readable by everyone signed in; written only through api.curriculum_*.
alter table public.content_locales enable row level security;
alter table public.curriculum_translations enable row level security;
create policy content_locales_read on public.content_locales for select to authenticated using (true);
create policy curriculum_translations_read on public.curriculum_translations
  for select to authenticated using (true);
grant select on public.content_locales, public.curriculum_translations to authenticated;
grant all on public.content_locales, public.curriculum_translations to service_role;

do $pub$
begin
  if exists (select 1 from pg_catalog.pg_publication where pubname = 'powersync') then
    alter publication powersync add table public.content_locales, public.curriculum_translations;
  end if;
end;
$pub$;

-- ---------------------------------------------------------------------------------------------
-- Validation (SQL twin of supabase/functions/_shared/curriculum.ts and scripts/lib/curriculum.mjs;
-- the Edge Function gives friendly per-field messages, the database refuses anything invalid).
-- ---------------------------------------------------------------------------------------------
create or replace function app.json_text(p_value jsonb)
returns boolean language sql immutable set search_path = '' as $$
  select jsonb_typeof(p_value) = 'string' and btrim(p_value #>> '{}') <> ''
$$;

create or replace function app.curriculum_problems(p_data jsonb)
returns text[]
language plpgsql
stable
set search_path = ''
as $$
declare
  v_errors text[] := '{}';
  v_sizes int[] := array[10, 10, 10, 10, 8];
  v_expected int := 1;
  v_mod jsonb;
  v_mi int;
  v_val jsonb;
  v_q jsonb;
  v_codes text[];
begin
  if jsonb_typeof(p_data -> 'modules') is distinct from 'array' then
    return array['El archivo debe ser un objeto con la lista "modules".'];
  end if;
  if jsonb_array_length(p_data -> 'modules') <> 5 then
    v_errors := v_errors || format('Se esperaban 5 módulos y hay %s.', jsonb_array_length(p_data -> 'modules'));
  end if;
  for v_mod, v_mi in
    select m.v, m.i::int from jsonb_array_elements(p_data -> 'modules') with ordinality as m(v, i)
  loop
    if jsonb_typeof(v_mod) is distinct from 'object' then
      v_errors := v_errors || format('modules[%s] debe ser un objeto.', v_mi - 1);
      continue;
    end if;
    if (v_mod ->> 'number') is distinct from v_mi::text then
      v_errors := v_errors || format('modules[%s].number debe ser %s.', v_mi - 1, v_mi);
    end if;
    if not app.json_text(v_mod -> 'name') then
      v_errors := v_errors || format('modules[%s].name es obligatorio.', v_mi - 1);
    end if;
    if jsonb_typeof(v_mod -> 'values') is distinct from 'array' then
      v_errors := v_errors || format('modules[%s].values debe ser una lista.', v_mi - 1);
      continue;
    end if;
    if v_mi <= 5 and jsonb_array_length(v_mod -> 'values') <> v_sizes[v_mi] then
      v_errors := v_errors || format('modules[%s] debe tener %s valores y tiene %s.',
        v_mi - 1, v_sizes[v_mi], jsonb_array_length(v_mod -> 'values'));
    end if;
    for v_val in select e from jsonb_array_elements(v_mod -> 'values') as e loop
      if jsonb_typeof(v_val) is distinct from 'object' then
        v_errors := v_errors || format('modules[%s] tiene un valor que no es un objeto.', v_mi - 1);
        v_expected := v_expected + 1;
        continue;
      end if;
      if (v_val ->> 'number') is distinct from v_expected::text then
        v_errors := v_errors || format('Valor n.º %s: el número debe ser %s (valores 1–48 en orden).',
          coalesce(v_val ->> 'number', '?'), v_expected);
      end if;
      v_expected := v_expected + 1;
      if not app.json_text(v_val -> 'name') then
        v_errors := v_errors || format('Valor %s: el nombre es obligatorio.', v_expected - 1);
      end if;
      if jsonb_typeof(v_val -> 'questions') is distinct from 'array'
         or jsonb_array_length(v_val -> 'questions') = 0 then
        v_errors := v_errors || format('Valor %s: se necesita al menos una pregunta.', v_expected - 1);
        continue;
      end if;
      v_codes := '{}';
      for v_q in select e from jsonb_array_elements(v_val -> 'questions') as e loop
        if jsonb_typeof(v_q) is distinct from 'object' then
          v_errors := v_errors || format('Valor %s: una pregunta no es un objeto.', v_expected - 1);
        elsif coalesce(v_q ->> 'code', '') !~ '^[a-z0-9_]{1,40}$' then
          v_errors := v_errors || format('Valor %s: el código de pregunta debe cumplir [a-z0-9_]{1,40}.', v_expected - 1);
        elsif (v_q ->> 'code') = any (v_codes) then
          v_errors := v_errors || format('Valor %s: código de pregunta repetido "%s".', v_expected - 1, v_q ->> 'code');
        else
          v_codes := v_codes || (v_q ->> 'code');
        end if;
        if jsonb_typeof(v_q) = 'object' then
          if not app.json_text(v_q -> 'text') then
            v_errors := v_errors || format('Valor %s: el texto de la pregunta es obligatorio.', v_expected - 1);
          end if;
          if v_q ? 'responseType' and (v_q ->> 'responseType') not in ('text', 'person') then
            v_errors := v_errors || format('Valor %s: responseType debe ser text o person.', v_expected - 1);
          end if;
        end if;
      end loop;
    end loop;
  end loop;
  return v_errors;
end;
$$;

-- A translation file has the shape of the curriculum file, but every entry is optional and only
-- needs the key (module / value number, question code) and the translated text.
create or replace function app.translation_problems(p_data jsonb)
returns text[]
language plpgsql
stable
set search_path = ''
as $$
declare
  v_errors text[] := '{}';
  v_mod jsonb;
  v_val jsonb;
  v_q jsonb;
  v_count int := 0;
begin
  if jsonb_typeof(p_data -> 'modules') is distinct from 'array' then
    return array['El archivo debe ser un objeto con la lista "modules".'];
  end if;
  for v_mod in select e from jsonb_array_elements(p_data -> 'modules') as e loop
    if jsonb_typeof(v_mod) is distinct from 'object'
       or not exists (select 1 from public.curriculum_modules where number::text = v_mod ->> 'number') then
      v_errors := v_errors || format('El módulo "%s" no existe.', coalesce(v_mod ->> 'number', '?'));
      continue;
    end if;
    v_count := v_count + 1;
    for v_val in select e from jsonb_array_elements(coalesce(v_mod -> 'values', '[]'::jsonb)) as e loop
      if not exists (select 1 from public.curriculum_values cv
                     join public.curriculum_modules cm on cm.id = cv.module_id
                     where cv.sequence::text = v_val ->> 'number' and cm.number::text = v_mod ->> 'number') then
        v_errors := v_errors || format('El valor "%s" no existe en el módulo %s.',
          coalesce(v_val ->> 'number', '?'), v_mod ->> 'number');
        continue;
      end if;
      for v_q in select e from jsonb_array_elements(coalesce(v_val -> 'questions', '[]'::jsonb)) as e loop
        if not exists (select 1 from public.value_questions q
                       join public.curriculum_values cv on cv.id = q.value_id
                       where cv.sequence::text = v_val ->> 'number' and q.question_code = v_q ->> 'code') then
          v_errors := v_errors || format('La pregunta "%s" no existe en el valor %s.',
            coalesce(v_q ->> 'code', '?'), v_val ->> 'number');
        end if;
      end loop;
    end loop;
  end loop;
  if v_count = 0 and cardinality(v_errors) = 0 then
    v_errors := array['El archivo no trae ningún texto para traducir.'];
  end if;
  return v_errors;
end;
$$;

-- ---------------------------------------------------------------------------------------------
-- Diff + apply of a full curriculum file. p_apply = false only reports; true also writes.
-- ---------------------------------------------------------------------------------------------
create or replace function app.field_diff(p_fields jsonb, p_name text, p_old text, p_new text)
returns jsonb language sql immutable set search_path = '' as $$
  select case when p_old is distinct from p_new
    then p_fields || jsonb_build_object(p_name, jsonb_build_object('from', p_old, 'to', p_new))
    else p_fields end
$$;

create or replace function app.curriculum_apply(p_data jsonb, p_apply boolean)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_changes jsonb := '[]';
  v_refused jsonb := '[]';
  v_mod jsonb;
  v_val jsonb;
  v_q jsonb;
  v_m public.curriculum_modules;
  v_v public.curriculum_values;
  v_row public.value_questions;
  v_fields jsonb;
  v_name text;
  v_desc text;
  v_booklet text;
  v_number int;
  v_pos int;
  v_order int;
  v_type text;
  v_text text;
  v_code text;
  v_codes text[];
  v_module_id uuid;
  v_answered boolean;
  v_key text;
begin
  for v_mod in select e from jsonb_array_elements(p_data -> 'modules') as e loop
    v_number := (v_mod ->> 'number')::int;
    v_name := btrim(v_mod ->> 'name');
    v_desc := nullif(btrim(v_mod ->> 'description'), '');
    select * into v_m from public.curriculum_modules where number = v_number;
    if not found then
      v_changes := v_changes || jsonb_build_object('entity', 'module', 'key', v_number::text,
        'label', v_name, 'action', 'create');
      if p_apply then
        insert into public.curriculum_modules (id, number, name, description, value_count)
        values (md5('gold-roundtables:module:' || v_number)::uuid, v_number, v_name, v_desc,
                jsonb_array_length(v_mod -> 'values'));
      end if;
    else
      v_fields := app.field_diff('{}', 'name', v_m.name, v_name);
      v_fields := app.field_diff(v_fields, 'description', v_m.description, v_desc);
      v_fields := app.field_diff(v_fields, 'value_count', v_m.value_count::text,
        jsonb_array_length(v_mod -> 'values')::text);
      v_fields := app.field_diff(v_fields, 'status', v_m.status::text, 'active');
      if v_fields <> '{}' then
        v_changes := v_changes || jsonb_build_object('entity', 'module', 'key', v_number::text,
          'label', v_name, 'action', 'update', 'fields', v_fields);
        if p_apply then
          update public.curriculum_modules set name = v_name, description = v_desc,
            value_count = jsonb_array_length(v_mod -> 'values'), status = 'active' where id = v_m.id;
        end if;
      end if;
    end if;
    select id into v_module_id from public.curriculum_modules where number = v_number;

    v_pos := 0;
    for v_val in select e from jsonb_array_elements(v_mod -> 'values') as e loop
      v_pos := v_pos + 1;
      v_number := (v_val ->> 'number')::int;
      v_name := btrim(v_val ->> 'name');
      v_desc := nullif(btrim(v_val ->> 'description'), '');
      v_booklet := nullif(btrim(v_val ->> 'bookletReference'), '');
      select * into v_v from public.curriculum_values where sequence = v_number;
      if not found then
        v_changes := v_changes || jsonb_build_object('entity', 'value', 'key', v_number::text,
          'label', v_name, 'action', 'create');
        if p_apply then
          insert into public.curriculum_values (id, module_id, number_in_module, sequence, name,
                                                description, booklet_reference)
          values (md5('gold-roundtables:value:' || v_number)::uuid, v_module_id, v_pos, v_number,
                  v_name, v_desc, v_booklet);
        end if;
      else
        if v_module_id is not null and (v_v.module_id <> v_module_id or v_v.number_in_module <> v_pos) then
          if exists (select 1 from public.sessions s where s.value_id = v_v.id) then
            v_refused := v_refused || jsonb_build_object('entity', 'value', 'key', v_number::text,
              'label', v_v.name, 'code', 'value_structure_locked',
              'message', 'El valor ya se usó en sesiones: no se puede mover de módulo ni de posición.');
          end if;
        end if;
        v_fields := app.field_diff('{}', 'name', v_v.name, v_name);
        v_fields := app.field_diff(v_fields, 'description', v_v.description, v_desc);
        v_fields := app.field_diff(v_fields, 'booklet_reference', v_v.booklet_reference, v_booklet);
        v_fields := app.field_diff(v_fields, 'status', v_v.status::text, 'active');
        if v_module_id is not null then
          v_fields := app.field_diff(v_fields, 'position', (v_v.module_id::text || ':' || v_v.number_in_module),
            (v_module_id::text || ':' || v_pos));
        end if;
        if v_fields <> '{}' then
          v_changes := v_changes || jsonb_build_object('entity', 'value', 'key', v_number::text,
            'label', v_name, 'action', 'update', 'fields', v_fields);
          if p_apply then
            update public.curriculum_values set name = v_name, description = v_desc,
              booklet_reference = v_booklet, status = 'active',
              module_id = coalesce(v_module_id, module_id), number_in_module = v_pos
            where id = v_v.id;
          end if;
        end if;
      end if;

      v_codes := '{}';
      v_order := 0;
      for v_q in select e from jsonb_array_elements(v_val -> 'questions') as e loop
        v_order := v_order + 1;
        v_code := v_q ->> 'code';
        v_text := btrim(v_q ->> 'text');
        v_type := coalesce(v_q ->> 'responseType', 'text');
        v_codes := v_codes || v_code;
        v_key := v_number || '/' || v_code;
        select * into v_row from public.value_questions
        where value_id = (select id from public.curriculum_values where sequence = v_number)
          and question_code = v_code;
        if not found then
          v_changes := v_changes || jsonb_build_object('entity', 'question', 'key', v_key,
            'label', v_text, 'action', 'create');
          if p_apply then
            insert into public.value_questions (id, value_id, question_code, question_text, sort_order, response_type)
            values (md5('gold-roundtables:question:' || v_number || ':' || v_code)::uuid,
                    (select id from public.curriculum_values where sequence = v_number),
                    v_code, v_text, v_order, v_type);
          end if;
        else
          v_answered := exists (select 1 from public.member_answers a where a.question_id = v_row.id);
          if v_answered and v_row.response_type <> v_type then
            v_refused := v_refused || jsonb_build_object('entity', 'question', 'key', v_key,
              'label', v_row.question_text, 'code', 'question_type_locked',
              'message', 'La pregunta ya tiene respuestas: no se puede cambiar su tipo de respuesta.');
          end if;
          v_fields := app.field_diff('{}', 'text', v_row.question_text, v_text);
          v_fields := app.field_diff(v_fields, 'sort_order', v_row.sort_order::text, v_order::text);
          v_fields := app.field_diff(v_fields, 'response_type', v_row.response_type, v_type);
          if v_row.status = 'inactive' then
            v_changes := v_changes || jsonb_build_object('entity', 'question', 'key', v_key,
              'label', v_text, 'action', 'reactivate', 'fields', v_fields);
          elsif v_fields <> '{}' then
            v_changes := v_changes || jsonb_build_object('entity', 'question', 'key', v_key,
              'label', v_text, 'action', 'update', 'fields', v_fields);
          end if;
          if p_apply and (v_fields <> '{}' or v_row.status = 'inactive') then
            update public.value_questions set question_text = v_text, sort_order = v_order,
              response_type = v_type, status = 'active' where id = v_row.id;
          end if;
        end if;
      end loop;

      for v_row in select q.* from public.value_questions q
        where q.value_id = (select id from public.curriculum_values where sequence = v_number)
          and q.status = 'active' and q.question_code <> all (v_codes)
      loop
        v_changes := v_changes || jsonb_build_object('entity', 'question',
          'key', v_number || '/' || v_row.question_code, 'label', v_row.question_text,
          'action', 'deactivate',
          'answered', exists (select 1 from public.member_answers a where a.question_id = v_row.id));
        if p_apply then
          update public.value_questions set status = 'inactive' where id = v_row.id;
        end if;
      end loop;
    end loop;
  end loop;
  return jsonb_build_object('changes', v_changes, 'refused', v_refused);
end;
$$;

-- Sets (merges) translated fields of one entity. Keys present in p_fields replace the stored
-- value (blank → cleared); keys absent are kept. Returns the change, or null when nothing changes.
create or replace function app.translation_set(
  p_locale text, p_type text, p_id uuid, p_label text, p_key text, p_fields jsonb, p_apply boolean)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_old public.curriculum_translations;
  v_name text;
  v_desc text;
  v_text text;
  v_diff jsonb;
  v_action text;
begin
  select * into v_old from public.curriculum_translations
  where locale = p_locale and entity_type = p_type and entity_id = p_id;
  v_name := case when p_fields ? 'name' then nullif(btrim(p_fields ->> 'name'), '') else v_old.name end;
  v_desc := case when p_type <> 'question' and p_fields ? 'description'
                 then nullif(btrim(p_fields ->> 'description'), '') else v_old.description end;
  v_text := case when p_type = 'question' and p_fields ? 'text'
                 then nullif(btrim(p_fields ->> 'text'), '') else v_old.question_text end;
  if p_type = 'question' then v_name := null; end if;
  v_diff := app.field_diff('{}', 'name', v_old.name, v_name);
  v_diff := app.field_diff(v_diff, 'description', v_old.description, v_desc);
  v_diff := app.field_diff(v_diff, 'text', v_old.question_text, v_text);
  if v_diff = '{}' then return null; end if;
  if v_name is null and v_desc is null and v_text is null then
    v_action := 'delete';
    if p_apply then delete from public.curriculum_translations where id = v_old.id; end if;
  elsif v_old.id is null then
    v_action := 'create';
    if p_apply then
      insert into public.curriculum_translations (locale, entity_type, entity_id, name, description, question_text)
      values (p_locale, p_type, p_id, v_name, v_desc, v_text);
    end if;
  else
    v_action := 'update';
    if p_apply then
      update public.curriculum_translations set name = v_name, description = v_desc,
        question_text = v_text where id = v_old.id;
    end if;
  end if;
  return jsonb_build_object('entity', p_type, 'key', p_key, 'label', p_label, 'action', v_action,
    'fields', v_diff);
end;
$$;

create or replace function app.translations_apply(p_locale text, p_data jsonb, p_apply boolean)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_changes jsonb := '[]';
  v_change jsonb;
  v_mod jsonb;
  v_val jsonb;
  v_q jsonb;
  v_id uuid;
  v_label text;
begin
  for v_mod in select e from jsonb_array_elements(p_data -> 'modules') as e loop
    select id, name into v_id, v_label from public.curriculum_modules where number::text = v_mod ->> 'number';
    v_change := app.translation_set(p_locale, 'module', v_id, v_label, v_mod ->> 'number',
      jsonb_strip_nulls(jsonb_build_object('name', v_mod -> 'name', 'description', v_mod -> 'description')),
      p_apply);
    if v_change is not null then v_changes := v_changes || v_change; end if;
    for v_val in select e from jsonb_array_elements(coalesce(v_mod -> 'values', '[]'::jsonb)) as e loop
      select id, name into v_id, v_label from public.curriculum_values where sequence::text = v_val ->> 'number';
      v_change := app.translation_set(p_locale, 'value', v_id, v_label, v_val ->> 'number',
        jsonb_strip_nulls(jsonb_build_object('name', v_val -> 'name', 'description', v_val -> 'description')),
        p_apply);
      if v_change is not null then v_changes := v_changes || v_change; end if;
      for v_q in select e from jsonb_array_elements(coalesce(v_val -> 'questions', '[]'::jsonb)) as e loop
        select q.id, q.question_text into v_id, v_label from public.value_questions q
        where q.value_id = (select id from public.curriculum_values where sequence::text = v_val ->> 'number')
          and q.question_code = v_q ->> 'code';
        v_change := app.translation_set(p_locale, 'question', v_id, v_label,
          (v_val ->> 'number') || '/' || (v_q ->> 'code'),
          jsonb_strip_nulls(jsonb_build_object('text', v_q -> 'text')), p_apply);
        if v_change is not null then v_changes := v_changes || v_change; end if;
      end loop;
    end loop;
  end loop;
  return jsonb_build_object('changes', v_changes, 'refused', '[]'::jsonb);
end;
$$;

-- ---------------------------------------------------------------------------------------------
-- Reading: the whole curriculum with one language's text and per-language completeness.
-- ---------------------------------------------------------------------------------------------
create or replace function app.translation_json(p_locale text, p_type text, p_id uuid)
returns jsonb language sql stable security definer set search_path = '' as $$
  select jsonb_build_object('name', tr.name, 'description', tr.description, 'text', tr.question_text)
  from public.curriculum_translations tr
  where p_locale is not null and tr.locale = p_locale and tr.entity_type = p_type and tr.entity_id = p_id
$$;

create or replace function app.curriculum_tree(p_locale text)
returns jsonb
language sql
stable
security definer
set search_path = ''
as $$
  select coalesce(jsonb_agg(jsonb_build_object(
    'id', m.id, 'number', m.number, 'name', m.name, 'description', m.description,
    'status', m.status, 'translation', app.translation_json(p_locale, 'module', m.id),
    'values', (
      select coalesce(jsonb_agg(jsonb_build_object(
        'id', v.id, 'number', v.sequence, 'number_in_module', v.number_in_module,
        'name', v.name, 'description', v.description, 'booklet_reference', v.booklet_reference,
        'status', v.status,
        'used_by_closed_sessions',
          exists (select 1 from public.sessions s where s.value_id = v.id and s.status = 'closed'),
        'translation', app.translation_json(p_locale, 'value', v.id),
        'questions', (
          select coalesce(jsonb_agg(jsonb_build_object(
            'id', q.id, 'code', q.question_code, 'text', q.question_text,
            'sort_order', q.sort_order, 'response_type', q.response_type, 'status', q.status,
            'answered', exists (select 1 from public.member_answers a where a.question_id = q.id),
            'translation', app.translation_json(p_locale, 'question', q.id)
          ) order by q.status, q.sort_order, q.question_code), '[]'::jsonb)
          from public.value_questions q where q.value_id = v.id)
      ) order by v.sequence), '[]'::jsonb)
      from public.curriculum_values v where v.module_id = m.id)
  ) order by m.number), '[]'::jsonb)
  from public.curriculum_modules m
$$;

-- How much of the Spanish text exists in a language: names of modules and values, active
-- questions, and the descriptions that have a Spanish description.
create or replace function app.locale_completeness(p_locale text)
returns jsonb
language sql
stable
security definer
set search_path = ''
as $$
  with base(entity_type, entity_id, field, text_value) as (
    select 'module', id, 'name', name from public.curriculum_modules
    union all select 'module', id, 'description', description from public.curriculum_modules
    union all select 'value', id, 'name', name from public.curriculum_values
    union all select 'value', id, 'description', description from public.curriculum_values
    union all select 'question', id, 'text', question_text from public.value_questions where status = 'active'
  ), wanted as (
    select * from base where nullif(btrim(text_value), '') is not null
  ), done as (
    select w.* from wanted w
    join public.curriculum_translations tr
      on tr.locale = p_locale and tr.entity_type = w.entity_type and tr.entity_id = w.entity_id
    where nullif(btrim(case w.field when 'name' then tr.name when 'description' then tr.description
                            else tr.question_text end), '') is not null
  )
  select jsonb_build_object('total', (select count(*) from wanted), 'translated', (select count(*) from done))
$$;

create or replace function app.locales_json()
returns jsonb
language sql
stable
security definer
set search_path = ''
as $$
  select coalesce(jsonb_agg(jsonb_build_object(
    'code', l.code, 'name', l.name, 'is_default', l.is_default, 'status', l.status,
    'completeness', case when l.is_default then null else app.locale_completeness(l.code) end
  ) order by l.is_default desc, l.code), '[]'::jsonb)
  from public.content_locales l
$$;

-- ---------------------------------------------------------------------------------------------
-- api.* operations (platform administrator only)
-- ---------------------------------------------------------------------------------------------
create or replace function app.curriculum_lock()
returns void language sql security definer set search_path = '' as $$
  select pg_advisory_xact_lock(hashtext('gold-roundtables:curriculum'))
$$;

create or replace function app.require_content_locale(p_code text, p_allow_default boolean default false)
returns void
language plpgsql
stable
security definer
set search_path = ''
as $$
declare
  v_locale public.content_locales;
begin
  select * into v_locale from public.content_locales where code = p_code;
  if not found then
    perform app.fail('locale_not_found', 'Ese idioma no está registrado.');
  elsif v_locale.is_default and not p_allow_default then
    perform app.fail('locale_is_default', 'El español es el idioma base: se edita en el currículo.');
  end if;
end;
$$;

create or replace function api.curriculum_get(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
stable
security definer
set search_path = ''
as $$
declare
  v_locale text := nullif(p_input ->> 'locale', '');
begin
  perform app.require_platform_admin(p_uid);
  if v_locale is not null then perform app.require_content_locale(v_locale, true); end if;
  return jsonb_build_object(
    'locale', v_locale,
    'locales', app.locales_json(),
    'modules', app.curriculum_tree(case when v_locale is not null
      and not exists (select 1 from public.content_locales where code = v_locale and is_default)
      then v_locale end));
end;
$$;

-- Upload of the full Spanish curriculum (JSON). p_input: { curriculum, dry_run, source }.
create or replace function api.curriculum_import(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_data jsonb := p_input -> 'curriculum';
  v_dry boolean := coalesce((p_input ->> 'dry_run')::boolean, false);
  v_problems text[];
  v_plan jsonb;
begin
  perform app.require_platform_admin(p_uid);
  perform app.curriculum_lock();
  v_problems := app.curriculum_problems(v_data);
  if cardinality(v_problems) > 0 then
    perform app.fail('curriculum_invalid', array_to_string(v_problems[1:5], ' '));
  end if;
  v_plan := app.curriculum_apply(v_data, false);
  if not v_dry then
    if jsonb_array_length(v_plan -> 'refused') > 0 then
      perform app.fail('curriculum_locked', v_plan -> 'refused' -> 0 ->> 'message');
    end if;
    if jsonb_array_length(v_plan -> 'changes') > 0 then
      perform app.curriculum_apply(v_data, true);
      perform app.audit(p_uid, app.actor_person(p_uid, null), null, 'curriculum.imported',
        'curriculum', null, jsonb_build_object('source', p_input ->> 'source',
          'changes', jsonb_array_length(v_plan -> 'changes')));
    end if;
  end if;
  return v_plan || jsonb_build_object('dry_run', v_dry,
    'applied', (not v_dry) and jsonb_array_length(v_plan -> 'changes') > 0);
end;
$$;

-- Upload of one language's text. p_input: { locale, curriculum, dry_run, source }.
create or replace function api.curriculum_translations_import(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_locale text := p_input ->> 'locale';
  v_data jsonb := p_input -> 'curriculum';
  v_dry boolean := coalesce((p_input ->> 'dry_run')::boolean, false);
  v_problems text[];
  v_plan jsonb;
begin
  perform app.require_platform_admin(p_uid);
  perform app.curriculum_lock();
  perform app.require_content_locale(v_locale);
  v_problems := app.translation_problems(v_data);
  if cardinality(v_problems) > 0 then
    perform app.fail('curriculum_invalid', array_to_string(v_problems[1:5], ' '));
  end if;
  v_plan := app.translations_apply(v_locale, v_data, false);
  if not v_dry and jsonb_array_length(v_plan -> 'changes') > 0 then
    perform app.translations_apply(v_locale, v_data, true);
    perform app.audit(p_uid, app.actor_person(p_uid, null), null, 'curriculum.translations_imported',
      'content_locale', (select id from public.content_locales where code = v_locale),
      jsonb_build_object('locale', v_locale, 'source', p_input ->> 'source',
        'changes', jsonb_array_length(v_plan -> 'changes')));
  end if;
  return v_plan || jsonb_build_object('dry_run', v_dry, 'locale', v_locale,
    'applied', (not v_dry) and jsonb_array_length(v_plan -> 'changes') > 0);
end;
$$;

-- Edits one module, value or question. p_input: { entity, id, locale?, name?, description?,
-- booklet_reference?, text?, response_type?, status?, sort_order? }. With a non-base locale the
-- text fields edit that language's translation; otherwise they edit the Spanish base.
create or replace function api.curriculum_edit(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_entity text := p_input ->> 'entity';
  v_id uuid := (p_input ->> 'id')::uuid;
  v_locale text := nullif(p_input ->> 'locale', '');
  v_base boolean;
  v_label text;
  v_change jsonb;
  v_q public.value_questions;
  v_name text;
  v_desc text;
begin
  perform app.require_platform_admin(p_uid);
  perform app.curriculum_lock();
  if v_entity not in ('module', 'value', 'question') then
    perform app.fail('validation_failed', 'La entidad debe ser module, value o question.');
  end if;
  v_base := v_locale is null
    or exists (select 1 from public.content_locales where code = v_locale and is_default);
  if not v_base then perform app.require_content_locale(v_locale); end if;
  v_label := case v_entity
    when 'module' then (select name from public.curriculum_modules where id = v_id)
    when 'value' then (select name from public.curriculum_values where id = v_id)
    else (select question_text from public.value_questions where id = v_id) end;
  if v_label is null then perform app.fail('not_found', 'Ese elemento del currículo no existe.'); end if;

  if not v_base then
    v_change := app.translation_set(v_locale, v_entity, v_id, v_label, v_id::text,
      p_input - 'entity' - 'id' - 'locale', true);
    if v_change is not null then
      perform app.audit(p_uid, app.actor_person(p_uid, null), null, 'curriculum.translation_edited',
        'curriculum_' || v_entity, v_id, jsonb_build_object('locale', v_locale, 'fields', v_change -> 'fields'));
    end if;
    return jsonb_build_object('changed', v_change is not null, 'change', v_change);
  end if;

  if v_entity = 'module' then
    v_name := case when p_input ? 'name' then btrim(p_input ->> 'name') end;
    if p_input ? 'name' and coalesce(v_name, '') = '' then
      perform app.fail('curriculum_invalid', 'El nombre es obligatorio.');
    end if;
    update public.curriculum_modules set
      name = coalesce(v_name, name),
      description = case when p_input ? 'description' then nullif(btrim(p_input ->> 'description'), '') else description end
    where id = v_id
      and (name is distinct from coalesce(v_name, name)
        or (p_input ? 'description' and description is distinct from nullif(btrim(p_input ->> 'description'), '')));
  elsif v_entity = 'value' then
    v_name := case when p_input ? 'name' then btrim(p_input ->> 'name') end;
    if p_input ? 'name' and coalesce(v_name, '') = '' then
      perform app.fail('curriculum_invalid', 'El nombre es obligatorio.');
    end if;
    update public.curriculum_values set
      name = coalesce(v_name, name),
      description = case when p_input ? 'description' then nullif(btrim(p_input ->> 'description'), '') else description end,
      booklet_reference = case when p_input ? 'booklet_reference' then nullif(btrim(p_input ->> 'booklet_reference'), '') else booklet_reference end
    where id = v_id
      and (name is distinct from coalesce(v_name, name)
        or (p_input ? 'description' and description is distinct from nullif(btrim(p_input ->> 'description'), ''))
        or (p_input ? 'booklet_reference' and booklet_reference is distinct from nullif(btrim(p_input ->> 'booklet_reference'), '')));
  else
    select * into v_q from public.value_questions where id = v_id;
    v_desc := case when p_input ? 'text' then btrim(p_input ->> 'text') end;
    if p_input ? 'text' and coalesce(v_desc, '') = '' then
      perform app.fail('curriculum_invalid', 'El texto de la pregunta es obligatorio.');
    end if;
    if p_input ? 'response_type' then
      if (p_input ->> 'response_type') not in ('text', 'person') then
        perform app.fail('validation_failed', 'El tipo de respuesta debe ser text o person.');
      end if;
      if (p_input ->> 'response_type') <> v_q.response_type
         and exists (select 1 from public.member_answers a where a.question_id = v_id) then
        perform app.fail('question_type_locked', 'La pregunta ya tiene respuestas: no se puede cambiar su tipo de respuesta.');
      end if;
    end if;
    if p_input ->> 'status' = 'inactive' and v_q.status = 'active' and not exists (
         select 1 from public.value_questions o
         where o.value_id = v_q.value_id and o.id <> v_id and o.status = 'active') then
      perform app.fail('question_last_active', 'Cada valor necesita al menos una pregunta activa.');
    end if;
    update public.value_questions set
      question_text = coalesce(v_desc, question_text),
      response_type = coalesce(p_input ->> 'response_type', response_type),
      sort_order = coalesce((p_input ->> 'sort_order')::smallint, sort_order),
      status = coalesce((p_input ->> 'status')::public.record_status, status)
    where id = v_id
      and (question_text is distinct from coalesce(v_desc, question_text)
        or response_type is distinct from coalesce(p_input ->> 'response_type', response_type)
        or sort_order is distinct from coalesce((p_input ->> 'sort_order')::smallint, sort_order)
        or status is distinct from coalesce((p_input ->> 'status')::public.record_status, status));
  end if;
  if found then
    perform app.audit(p_uid, app.actor_person(p_uid, null), null, 'curriculum.edited',
      'curriculum_' || v_entity, v_id, p_input - 'entity' - 'id');
  end if;
  return jsonb_build_object('changed', found);
end;
$$;

-- Adds a question to a value (or reactivates a deactivated one with the same code).
create or replace function api.curriculum_question_create(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_value public.curriculum_values;
  v_code text := p_input ->> 'code';
  v_text text := btrim(p_input ->> 'text');
  v_type text := coalesce(p_input ->> 'response_type', 'text');
  v_row public.value_questions;
begin
  perform app.require_platform_admin(p_uid);
  perform app.curriculum_lock();
  select * into v_value from public.curriculum_values where id = (p_input ->> 'value_id')::uuid;
  if not found then perform app.fail('not_found', 'El valor no existe.'); end if;
  if coalesce(v_code, '') !~ '^[a-z0-9_]{1,40}$' then
    perform app.fail('curriculum_invalid', 'El código debe usar minúsculas, números o guion bajo (máximo 40).');
  end if;
  if coalesce(v_text, '') = '' then
    perform app.fail('curriculum_invalid', 'El texto de la pregunta es obligatorio.');
  end if;
  if v_type not in ('text', 'person') then
    perform app.fail('validation_failed', 'El tipo de respuesta debe ser text o person.');
  end if;
  select * into v_row from public.value_questions where value_id = v_value.id and question_code = v_code;
  if found and v_row.status = 'active' then
    perform app.fail('duplicate_question', 'Ya existe una pregunta activa con ese código en este valor.');
  elsif found then
    if v_row.response_type <> v_type
       and exists (select 1 from public.member_answers a where a.question_id = v_row.id) then
      perform app.fail('question_type_locked', 'La pregunta ya tiene respuestas: no se puede cambiar su tipo de respuesta.');
    end if;
    update public.value_questions set question_text = v_text, response_type = v_type, status = 'active',
      sort_order = (select coalesce(max(sort_order), 0) + 1 from public.value_questions where value_id = v_value.id)
    where id = v_row.id returning * into v_row;
  else
    insert into public.value_questions (id, value_id, question_code, question_text, sort_order, response_type)
    values (md5('gold-roundtables:question:' || v_value.sequence || ':' || v_code)::uuid, v_value.id, v_code, v_text,
            (select coalesce(max(sort_order), 0) + 1 from public.value_questions where value_id = v_value.id),
            v_type)
    returning * into v_row;
  end if;
  perform app.audit(p_uid, app.actor_person(p_uid, null), null, 'curriculum.question_created',
    'curriculum_question', v_row.id, jsonb_build_object('value', v_value.sequence, 'code', v_code));
  return jsonb_build_object('id', v_row.id, 'code', v_row.question_code);
end;
$$;

create or replace function api.content_locale_add(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_locale public.content_locales;
begin
  perform app.require_platform_admin(p_uid);
  if exists (select 1 from public.content_locales where code = lower(btrim(p_input ->> 'code'))) then
    perform app.fail('duplicate_locale', 'Ese idioma ya está registrado.');
  end if;
  insert into public.content_locales (code, name)
  values (lower(btrim(p_input ->> 'code')), btrim(p_input ->> 'name'))
  returning * into v_locale;
  perform app.audit(p_uid, app.actor_person(p_uid, null), null, 'curriculum.locale_added',
    'content_locale', v_locale.id, jsonb_build_object('code', v_locale.code, 'name', v_locale.name));
  return to_jsonb(v_locale);
end;
$$;

create or replace function api.content_locale_update(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_locale public.content_locales;
begin
  perform app.require_platform_admin(p_uid);
  perform app.require_content_locale(p_input ->> 'code');
  update public.content_locales set
    name = coalesce(nullif(btrim(p_input ->> 'name'), ''), name),
    status = coalesce((p_input ->> 'status')::public.record_status, status)
  where code = p_input ->> 'code'
  returning * into v_locale;
  perform app.audit(p_uid, app.actor_person(p_uid, null), null, 'curriculum.locale_updated',
    'content_locale', v_locale.id, p_input - 'code' || jsonb_build_object('code', v_locale.code));
  return to_jsonb(v_locale);
end;
$$;

revoke execute on function api.curriculum_get(uuid, jsonb), api.curriculum_import(uuid, jsonb),
  api.curriculum_translations_import(uuid, jsonb), api.curriculum_edit(uuid, jsonb),
  api.curriculum_question_create(uuid, jsonb), api.content_locale_add(uuid, jsonb),
  api.content_locale_update(uuid, jsonb) from public, anon, authenticated;
grant execute on function api.curriculum_get(uuid, jsonb), api.curriculum_import(uuid, jsonb),
  api.curriculum_translations_import(uuid, jsonb), api.curriculum_edit(uuid, jsonb),
  api.curriculum_question_create(uuid, jsonb), api.content_locale_add(uuid, jsonb),
  api.content_locale_update(uuid, jsonb) to service_role;

