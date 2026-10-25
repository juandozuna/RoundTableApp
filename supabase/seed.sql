-- Gold Roundtables — local/dev seed (applied by `supabase db reset`).
--
-- All data is fictional. Ids are deterministic (md5 of a label) so the Flutter team can rely on
-- them across resets; timestamps are relative to now() so health states stay meaningful.
-- Every account (dev users and generated people) uses the password `dev-password-123`.
--
-- Dev users (docs/implementation/PLAN.md):
--   admin@dev.local   platform admin (Marisol Peña, church staff)
--   coord@dev.local   coordinator of Fundación Luz (Julia Ferrer), also member of Mesa Fe 01
--   facil@dev.local   facilitator of Mesa Esperanza 03 (Sofía Herrera)
--   ana@dev.local, luis@dev.local, marta@dev.local   members of Mesa Esperanza 03
--
-- Seeded invite codes: MESA34 (pending member, Mesa Esperanza 03), VENC22 (expired),
-- REVK23 (revoked), ACEP24 (accepted by ana), CRDN26 (pending coordinator, Fundación Luz),
-- FACL27 (pending facilitator, Mesa Nueva 07).

select set_config('app.seeding', 'on', false);

-- ---------------------------------------------------------------------------------------------
-- Helpers (session-local)
-- ---------------------------------------------------------------------------------------------
create function pg_temp.uid(p_label text) returns uuid
language sql immutable as $$ select md5('gold-roundtables:' || p_label)::uuid $$;

-- Deterministic pseudo-random integer 0..99 for a label.
create function pg_temp.rnd(p_label text) returns integer
language sql immutable as $$
  select abs(('x' || substr(md5(p_label), 1, 8))::bit(32)::integer) % 100
$$;

-- Clamp to 1..10 and steer away from the forbidden 5.
create function pg_temp.score(p_raw integer, p_lean_up boolean) returns smallint
language sql immutable as $$
  select (case when least(10, greatest(1, p_raw)) = 5 then case when p_lean_up then 6 else 4 end
               else least(10, greatest(1, p_raw)) end)::smallint
$$;

create function pg_temp.make_user(p_id uuid, p_email text) returns void
language sql as $$
  insert into auth.users (instance_id, id, aud, role, email, encrypted_password,
    email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, updated_at,
    confirmation_token, recovery_token, email_change_token_new, email_change,
    email_change_token_current, phone_change, phone_change_token, reauthentication_token)
  values ('00000000-0000-0000-0000-000000000000', p_id, 'authenticated', 'authenticated', p_email,
    extensions.crypt('dev-password-123', extensions.gen_salt('bf')), now(),
    '{"provider":"email","providers":["email"]}'::jsonb, '{}'::jsonb, now(), now(),
    '', '', '', '', '', '', '', '');
  insert into auth.identities (id, user_id, provider_id, identity_data, provider,
                               last_sign_in_at, created_at, updated_at)
  values (gen_random_uuid(), p_id, p_id::text,
          jsonb_build_object('sub', p_id::text, 'email', p_email, 'email_verified', true),
          'email', now(), now(), now());
$$;

-- ---------------------------------------------------------------------------------------------
-- Curriculum: 5 modules, 48 values (placeholder names), 2–3 reflection questions each.
-- ---------------------------------------------------------------------------------------------
insert into public.curriculum_modules (id, number, name, description, value_count) values
  (pg_temp.uid('module:1'), 1, 'Carácter', 'Nombre provisional del módulo 1', 10),
  (pg_temp.uid('module:2'), 2, 'Relaciones', 'Nombre provisional del módulo 2', 10),
  (pg_temp.uid('module:3'), 3, 'Trabajo y excelencia', 'Nombre provisional del módulo 3', 10),
  (pg_temp.uid('module:4'), 4, 'Liderazgo', 'Nombre provisional del módulo 4', 10),
  (pg_temp.uid('module:5'), 5, 'Propósito y legado', 'Nombre provisional del módulo 5', 8);

with names (module, n, name) as (
  values
    (1, 1, 'Integridad'), (1, 2, 'Gratitud'), (1, 3, 'Honestidad'), (1, 4, 'Responsabilidad'),
    (1, 5, 'Humildad'), (1, 6, 'Respeto'), (1, 7, 'Disciplina'), (1, 8, 'Paciencia'),
    (1, 9, 'Perseverancia'), (1, 10, 'Lealtad'),
    (2, 1, 'Empatía'), (2, 2, 'Perdón'), (2, 3, 'Generosidad'), (2, 4, 'Amabilidad'),
    (2, 5, 'Escucha'), (2, 6, 'Servicio'), (2, 7, 'Compasión'), (2, 8, 'Confianza'),
    (2, 9, 'Unidad'), (2, 10, 'Hospitalidad'),
    (3, 1, 'Diligencia'), (3, 2, 'Excelencia'), (3, 3, 'Puntualidad'), (3, 4, 'Iniciativa'),
    (3, 5, 'Orden'), (3, 6, 'Creatividad'), (3, 7, 'Compromiso'), (3, 8, 'Mayordomía'),
    (3, 9, 'Productividad'), (3, 10, 'Aprendizaje'),
    (4, 1, 'Visión'), (4, 2, 'Valentía'), (4, 3, 'Justicia'), (4, 4, 'Sabiduría'),
    (4, 5, 'Prudencia'), (4, 6, 'Influencia'), (4, 7, 'Delegación'),
    (4, 8, 'Rendición de cuentas'), (4, 9, 'Coherencia'), (4, 10, 'Mentoría'),
    (5, 1, 'Fe'), (5, 2, 'Esperanza'), (5, 3, 'Gozo'), (5, 4, 'Paz'), (5, 5, 'Dominio propio'),
    (5, 6, 'Fidelidad'), (5, 7, 'Propósito'), (5, 8, 'Legado')
)
insert into public.curriculum_values (id, module_id, number_in_module, sequence, name,
                                      description, booklet_reference)
select pg_temp.uid('value:' || ((module - 1) * 10 + n)), pg_temp.uid('module:' || module), n,
       (module - 1) * 10 + n, name, 'Nombre provisional', 'Cuadernillo M' || module || ' · V' || n
from names;

insert into public.value_questions (id, value_id, question_code, question_text, sort_order, response_type)
select pg_temp.uid('question:' || cv.sequence || ':' || q.code), cv.id, q.code,
       replace(q.template, '{valor}', lower(cv.name)), q.sort_order, q.response_type
from public.curriculum_values cv
cross join (values
  ('por_que', '¿Por qué te diste ese puntaje en {valor}?', 1, 'text'),
  ('ejemplo', '¿Quién es para ti un ejemplo de {valor}?', 2, 'person'),
  ('situacion', '¿En qué situación de esta semana necesitaste {valor}?', 3, 'text')
) as q(code, template, sort_order, response_type)
-- Every third value has only the first two questions (2–3 per value).
where q.code <> 'situacion' or cv.sequence % 3 <> 0;

-- ---------------------------------------------------------------------------------------------
-- Organizations and locations
-- ---------------------------------------------------------------------------------------------
insert into public.organizations (id, name, kind, country_code, country_name, region,
                                  contact_name, contact_email, contact_phone) values
  (pg_temp.uid('org:luz'), 'Fundación Luz', 'foundation', 'DO', 'República Dominicana',
   'Distrito Nacional', 'Julia Ferrer', 'contacto@fundacionluz.example', '+18095550101'),
  (pg_temp.uid('org:horizonte'), 'Colegio Horizonte', 'school', 'CO', 'Colombia',
   'Cundinamarca', 'Andrés Rincón', 'rectoria@colegiohorizonte.example', '+576015550102'),
  (pg_temp.uid('org:andina'), 'Empresa Andina', 'company', 'CO', 'Colombia',
   'Antioquia', 'Paula Restrepo', 'bienestar@empresaandina.example', '+576045550103');

insert into public.locations (id, organization_id, name, city, region, address) values
  (pg_temp.uid('loc:luz-central'), pg_temp.uid('org:luz'), 'Sede Central', 'Santo Domingo', 'Distrito Nacional', 'Av. Independencia 100'),
  (pg_temp.uid('loc:luz-santiago'), pg_temp.uid('org:luz'), 'Sede Santiago', 'Santiago', 'Santiago', 'Calle del Sol 25'),
  (pg_temp.uid('loc:hor-norte'), pg_temp.uid('org:horizonte'), 'Campus Norte', 'Bogotá', 'Cundinamarca', 'Cra. 7 #150-20'),
  (pg_temp.uid('loc:hor-sur'), pg_temp.uid('org:horizonte'), 'Campus Sur', 'Bogotá', 'Cundinamarca', 'Av. Boyacá #40-10'),
  (pg_temp.uid('loc:and-medellin'), pg_temp.uid('org:andina'), 'Planta Medellín', 'Medellín', 'Antioquia', 'Cl. 30 #65-15'),
  (pg_temp.uid('loc:and-bogota'), pg_temp.uid('org:andina'), 'Oficina Bogotá', 'Bogotá', 'Cundinamarca', 'Cl. 93 #11-30');

-- ---------------------------------------------------------------------------------------------
-- Platform admin, coordinators
-- ---------------------------------------------------------------------------------------------
select pg_temp.make_user(pg_temp.uid('user:admin'), 'admin@dev.local');
insert into public.people (id, organization_id, auth_user_id, first_name, last_name, position, email, phone, status)
values (pg_temp.uid('person:admin'), null, pg_temp.uid('user:admin'), 'Marisol', 'Peña',
        'Coordinación nacional · Iglesia Casa del Altísimo', 'admin@dev.local', '+18095550001', 'active');
insert into public.role_assignments (id, person_id, role)
values (pg_temp.uid('role:admin'), pg_temp.uid('person:admin'), 'platform_admin');

select pg_temp.make_user(pg_temp.uid('user:coord'), 'coord@dev.local');
insert into public.people (id, organization_id, auth_user_id, first_name, last_name, position, email, phone, status)
values (pg_temp.uid('person:coord'), pg_temp.uid('org:luz'), pg_temp.uid('user:coord'), 'Julia', 'Ferrer',
        'Coordinadora de mesas', 'coord@dev.local', '+18095550002', 'active');
insert into public.role_assignments (id, person_id, role, organization_id)
values (pg_temp.uid('role:coord'), pg_temp.uid('person:coord'), 'coordinator', pg_temp.uid('org:luz'));

select pg_temp.make_user(pg_temp.uid('user:coord-horizonte'), 'coord.horizonte@seed.local');
insert into public.people (id, organization_id, auth_user_id, first_name, last_name, position, email, status)
values (pg_temp.uid('person:coord-horizonte'), pg_temp.uid('org:horizonte'), pg_temp.uid('user:coord-horizonte'),
        'Andrés', 'Rincón', 'Capellanía', 'coord.horizonte@seed.local', 'active');
insert into public.role_assignments (id, person_id, role, organization_id)
values (pg_temp.uid('role:coord-horizonte'), pg_temp.uid('person:coord-horizonte'), 'coordinator', pg_temp.uid('org:horizonte'));

select pg_temp.make_user(pg_temp.uid('user:coord-andina'), 'coord.andina@seed.local');
insert into public.people (id, organization_id, auth_user_id, first_name, last_name, position, email, status)
values (pg_temp.uid('person:coord-andina'), pg_temp.uid('org:andina'), pg_temp.uid('user:coord-andina'),
        'Paula', 'Restrepo', 'Bienestar laboral', 'coord.andina@seed.local', 'active');
insert into public.role_assignments (id, person_id, role, organization_id)
values (pg_temp.uid('role:coord-andina'), pg_temp.uid('person:coord-andina'), 'coordinator', pg_temp.uid('org:andina'));

-- ---------------------------------------------------------------------------------------------
-- Tables, people, memberships and session history
--
-- scenario: active   → last session within the week, next session upcoming
--           delayed  → last session 3 weeks ago, pending session overdue
--           stale    → table active but no session for ~9 weeks (health: inactive)
--           paused   → table paused (health: inactive)
--           closed   → table closed (health: inactive)
--           new      → no history yet
-- ---------------------------------------------------------------------------------------------
create temp table seed_tables (
  key text primary key, org text, loc text, code text, name text, tz text, weekday smallint,
  start_time time, members integer, history integer, scenario text, late_pct integer
);

insert into seed_tables values
  ('luz-01', 'luz', 'luz-central', 'LUZ-01', 'Mesa Fe 01', 'America/Santo_Domingo', 2, '19:00', 6, 8, 'active', 0),
  ('luz-02', 'luz', 'luz-central', 'LUZ-02', 'Mesa Alba 02', 'America/Santo_Domingo', 3, '18:30', 7, 12, 'active', 3),
  ('luz-03', 'luz', 'luz-central', 'LUZ-03', 'Mesa Esperanza 03', 'America/Santo_Domingo', 1, '19:00', 5, 3, 'esperanza', 0),
  ('luz-04', 'luz', 'luz-central', 'LUZ-04', 'Mesa Camino 04', 'America/Santo_Domingo', 4, '07:30', 5, 6, 'delayed', 0),
  ('luz-05', 'luz', 'luz-santiago', 'LUZ-05', 'Mesa Roble 05', 'America/Santo_Domingo', 5, '20:00', 8, 10, 'active', 5),
  ('luz-06', 'luz', 'luz-santiago', 'LUZ-06', 'Mesa Faro 06', 'America/Santo_Domingo', 6, '09:00', 4, 5, 'paused', 0),
  ('luz-07', 'luz', 'luz-santiago', 'LUZ-07', 'Mesa Nueva 07', 'America/Santo_Domingo', 3, '19:30', 0, 0, 'new', 0),
  ('hor-01', 'horizonte', 'hor-norte', 'HOR-01', 'Mesa Docentes 01', 'America/Bogota', 2, '15:00', 8, 14, 'active', 2),
  ('hor-02', 'horizonte', 'hor-norte', 'HOR-02', 'Mesa Padres 02', 'America/Bogota', 6, '10:00', 6, 7, 'delayed', 0),
  ('hor-03', 'horizonte', 'hor-sur', 'HOR-03', 'Mesa Bachillerato 03', 'America/Bogota', 4, '11:00', 7, 9, 'active', 4),
  ('hor-04', 'horizonte', 'hor-sur', 'HOR-04', 'Mesa Directivos 04', 'America/Bogota', 1, '07:00', 4, 4, 'stale', 0),
  ('hor-05', 'horizonte', 'hor-sur', 'HOR-05', 'Mesa Semilla 05', 'America/Bogota', 5, '14:00', 3, 1, 'active', 0),
  ('and-01', 'andina', 'and-medellin', 'AND-01', 'Mesa Planta 01', 'America/Bogota', 2, '06:30', 8, 11, 'active', 6),
  ('and-02', 'andina', 'and-medellin', 'AND-02', 'Mesa Logística 02', 'America/Bogota', 3, '13:00', 7, 9, 'active', 25),
  ('and-03', 'andina', 'and-bogota', 'AND-03', 'Mesa Ventas 03', 'America/Bogota', 4, '08:00', 5, 5, 'delayed', 10),
  ('and-04', 'andina', 'and-bogota', 'AND-04', 'Mesa Gerencia 04', 'America/Bogota', 5, '07:30', 4, 6, 'closed', 0),
  ('and-05', 'andina', 'and-medellin', 'AND-05', 'Mesa Calidad 05', 'America/Bogota', 1, '16:00', 6, 4, 'active', 0);

-- Mesa Esperanza 03 meets today, one hour from now (local), so the live flow can be tried.
update seed_tables set
  weekday = extract(isodow from now() at time zone 'America/Santo_Domingo')::smallint,
  start_time = (date_trunc('hour', now() at time zone 'America/Santo_Domingo') + interval '1 hour')::time
where key = 'luz-03';

do $seed$
declare
  t record;
  v_org uuid;
  v_table uuid;
  v_first_names text[] := array['Carlos','María','José','Lucía','Pedro','Carmen','Miguel','Elena',
    'Javier','Rosa','Diego','Patricia','Andrés','Gabriela','Fernando','Daniela','Ricardo','Natalia',
    'Héctor','Verónica','Óscar','Adriana','Raúl','Beatriz','Tomás','Silvia','Esteban','Paola',
    'Gustavo','Lorena','Manuel','Teresa','Álvaro','Inés','Sebastián','Claudia'];
  v_last_names text[] := array['García','Rodríguez','Martínez','López','Pérez','Gómez','Díaz',
    'Sánchez','Ramírez','Torres','Flores','Rivera','Castillo','Morales','Ortiz','Jiménez','Vargas',
    'Rojas','Herrera','Medina','Aguilar','Cabrera','Mejía','Guzmán','Salazar','Fuentes','Paredes',
    'Valdez','Cordero','Espinal'];
  v_people uuid[];
  v_person uuid;
  v_fac uuid;
  v_idx integer := 0;
  v_now timestamptz := now();
  v_last_slot timestamptz;
  v_slot timestamptz;
  v_session uuid;
  v_prev_session uuid;
  v_value uuid;
  v_prev_value uuid;
  v_started timestamptz;
  v_ended timestamptz;
  v_label text;
  v_present boolean;
  v_late boolean;
  v_received timestamptz;
  v_initial smallint;
  v_follow smallint;
  v_base integer;
  v_joined timestamptz;
  q record;
  i integer;
  k integer;
begin
  for t in select * from seed_tables order by key loop
    v_org := pg_temp.uid('org:' || t.org);
    v_table := pg_temp.uid('table:' || t.key);

    -- Anchor: the most recent weekly slot of the table before now.
    v_last_slot := app.next_slot(v_table, t.weekday, t.start_time, t.tz, v_now - interval '7 days');
    if v_last_slot > v_now then
      v_last_slot := v_last_slot - interval '7 days';
    end if;
    v_last_slot := v_last_slot - case t.scenario
      when 'delayed' then interval '21 days'
      when 'stale' then interval '63 days'
      when 'paused' then interval '42 days'
      when 'closed' then interval '35 days'
      when 'esperanza' then interval '0 days'
      else interval '0 days' end;
    if t.scenario = 'esperanza' then
      -- The pending session is today; the last closed one was a week earlier.
      v_last_slot := app.next_slot(v_table, t.weekday, t.start_time, t.tz, v_now - interval '1 day')
                     - interval '7 days';
    end if;
    v_joined := v_last_slot - make_interval(days => 7 * t.history + 14);

    insert into public.round_tables (id, organization_id, location_id, name, code, weekday,
                                     start_time, timezone, status, current_value_id, created_at)
    values (v_table, v_org, pg_temp.uid('loc:' || t.loc), t.name, t.code, t.weekday, t.start_time,
            t.tz, case t.scenario when 'paused' then 'paused'::public.round_table_status
                                  else 'active'::public.round_table_status end,
            pg_temp.uid('value:' || (t.history + 1)), v_joined);

    -- People: facilitator + members
    v_people := array[]::uuid[];
    if t.key = 'luz-03' then
      perform pg_temp.make_user(pg_temp.uid('user:facil'), 'facil@dev.local');
      perform pg_temp.make_user(pg_temp.uid('user:ana'), 'ana@dev.local');
      perform pg_temp.make_user(pg_temp.uid('user:luis'), 'luis@dev.local');
      perform pg_temp.make_user(pg_temp.uid('user:marta'), 'marta@dev.local');
      insert into public.people (id, organization_id, auth_user_id, first_name, last_name, position, email, phone, status) values
        (pg_temp.uid('person:facil'), v_org, pg_temp.uid('user:facil'), 'Sofía', 'Herrera', 'Facilitadora', 'facil@dev.local', '+18095550010', 'active'),
        (pg_temp.uid('person:ana'), v_org, pg_temp.uid('user:ana'), 'Ana Lucía', 'Méndez', 'Voluntaria', 'ana@dev.local', '+18095550011', 'active'),
        (pg_temp.uid('person:luis'), v_org, pg_temp.uid('user:luis'), 'Luis', 'Ferrer', null, 'luis@dev.local', '+18095550012', 'active'),
        (pg_temp.uid('person:marta'), v_org, pg_temp.uid('user:marta'), 'Marta', 'Quiroz', 'Docente', 'marta@dev.local', '+18095550013', 'active'),
        (pg_temp.uid('person:joaquin'), v_org, null, 'Joaquín', 'Mena', null, 'joaquin.mena@seed.local', '+18095550014', 'active'),
        (pg_temp.uid('person:camila'), v_org, null, 'Camila', 'Rojas', null, 'camila.rojas@seed.local', '+18095550015', 'active');
      perform pg_temp.make_user(pg_temp.uid('user:joaquin'), 'joaquin.mena@seed.local');
      perform pg_temp.make_user(pg_temp.uid('user:camila'), 'camila.rojas@seed.local');
      update public.people set auth_user_id = pg_temp.uid('user:joaquin') where id = pg_temp.uid('person:joaquin');
      update public.people set auth_user_id = pg_temp.uid('user:camila') where id = pg_temp.uid('person:camila');
      v_fac := pg_temp.uid('person:facil');
      v_people := array[v_fac, pg_temp.uid('person:ana'), pg_temp.uid('person:luis'),
                        pg_temp.uid('person:marta'), pg_temp.uid('person:joaquin'),
                        pg_temp.uid('person:camila')];
    else
      for i in 0..t.members loop
        v_idx := v_idx + 1;
        v_person := pg_temp.uid('person:' || t.key || ':' || i);
        v_label := lower(translate(v_first_names[1 + (v_idx * 7) % array_length(v_first_names, 1)],
                         'ÁÉÍÓÚáéíóúñ', 'AEIOUaeioun'))
                   || '.' || lower(translate(v_last_names[1 + (v_idx * 11) % array_length(v_last_names, 1)],
                         'ÁÉÍÓÚáéíóúñ', 'AEIOUaeioun'))
                   || '.' || v_idx || '@seed.local';
        perform pg_temp.make_user(pg_temp.uid('user:' || t.key || ':' || i), v_label);
        insert into public.people (id, organization_id, auth_user_id, first_name, last_name,
                                   position, email, phone, status)
        values (v_person, v_org, pg_temp.uid('user:' || t.key || ':' || i),
                v_first_names[1 + (v_idx * 7) % array_length(v_first_names, 1)],
                v_last_names[1 + (v_idx * 11) % array_length(v_last_names, 1)],
                case when i = 0 then 'Facilitador(a)' end, v_label,
                case when t.org = 'luz' then '+1809555' else '+57300555' end || lpad(v_idx::text, 4, '0'),
                'active');
        v_people := v_people || v_person;
        if i = 0 then
          v_fac := v_person;
        end if;
      end loop;
      if t.key = 'luz-07' then
        -- Brand-new table whose facilitator has not accepted the invite yet.
        update public.people set auth_user_id = null, status = 'invited', first_name = 'Rosa',
          last_name = 'Montenegro', email = 'rosa.montenegro@seed.local'
        where id = v_fac;
      end if;
    end if;

    for i in 1..array_length(v_people, 1) loop
      insert into public.table_members (id, organization_id, round_table_id, person_id, role, joined_at)
      values (pg_temp.uid('tm:' || t.key || ':' || v_people[i]), v_org, v_table, v_people[i],
              case when i = 1 then 'facilitator'::public.table_member_role else 'member' end, v_joined);
    end loop;

    -- History: closed sessions, value 1..history, weekly up to v_last_slot.
    v_prev_session := null;
    v_prev_value := null;
    for k in 1..t.history loop
      v_slot := v_last_slot - make_interval(days => 7 * (t.history - k));
      v_session := pg_temp.uid('session:' || t.key || ':' || k);
      v_value := pg_temp.uid('value:' || k);
      v_started := v_slot + make_interval(mins => 2 + pg_temp.rnd(v_session::text) % 6);
      v_ended := v_started + make_interval(mins => 24 + pg_temp.rnd(v_session::text || 'e') % 9);

      insert into public.sessions (id, organization_id, round_table_id, value_id, follow_up_value_id,
                                   status, stage, scheduled_at, started_at, ended_at,
                                   answers_closed_at, facilitator_person_id, created_at)
      values (v_session, v_org, v_table, v_value, v_prev_value, 'closed', 'closed', v_slot,
              v_started, v_ended, v_ended - interval '2 minutes', v_fac, v_slot - interval '7 days');

      for i in 1..array_length(v_people, 1) loop
        v_person := v_people[i];
        v_label := v_session::text || v_person::text;
        v_present := i = 1 or pg_temp.rnd(v_label || 'p') >= 15;
        v_late := v_present and i > 1 and pg_temp.rnd(v_label || 'l') < t.late_pct;
        v_received := case when v_late then v_ended + make_interval(hours => 2 + pg_temp.rnd(v_label || 'h') % 40)
                           else v_started + make_interval(mins => 10 + pg_temp.rnd(v_label || 'm') % 15) end;

        insert into public.session_attendance (id, session_id, person_id, status, source,
          recorded_by_person_id, device_created_at, received_at, synced_late,
          organization_id, round_table_id)
        values (pg_temp.uid('att:' || v_label), v_session, v_person,
                case when v_present then (case when pg_temp.rnd(v_label || 't') < 8 then 'late' else 'present' end)::public.attendance_status
                     when pg_temp.rnd(v_label || 'x') < 30 then 'excused' else 'absent' end,
                'facilitator', v_fac, v_started + interval '3 minutes',
                v_started + interval '4 minutes', false, v_org, v_table);

        continue when not v_present;

        -- Follow-up of the previous value (person was present last week and committed).
        if v_prev_session is not null and exists (
             select 1 from public.member_commitments
             where session_id = v_prev_session and person_id = v_person) then
          select score into v_initial from public.member_assessments
          where session_id = v_prev_session and person_id = v_person and kind = 'initial';
          v_follow := pg_temp.score(v_initial + (pg_temp.rnd(v_label || 'f') % 4) - 1, true);
          insert into public.member_assessments (id, session_id, person_id, kind, score,
            justification, device_created_at, received_at, synced_late,
            organization_id, round_table_id, value_id)
          values (pg_temp.uid('fu:' || v_label), v_session, v_person, 'follow_up', v_follow,
                  null, v_started + interval '8 minutes', v_received, v_late, v_org, v_table, v_prev_value);
          update public.member_commitments set
            follow_up_session_id = v_session,
            follow_up_status = (array['kept', 'kept', 'partial', 'not_kept'])[1 + pg_temp.rnd(v_label || 'k') % 4]::public.commitment_follow_up_status,
            follow_up_note = case when pg_temp.rnd(v_label || 'n') < 50 then 'Lo practiqué varias veces en la semana.' end,
            follow_up_device_at = v_started + interval '7 minutes',
            follow_up_received_at = v_received,
            follow_up_synced_late = v_late
          where session_id = v_prev_session and person_id = v_person;
        end if;

        -- Current value: reflection answers, initial score, commitment.
        for q in select vq.id, vq.question_code from public.value_questions vq
                 where vq.value_id = v_value order by vq.sort_order loop
          insert into public.member_answers (id, session_id, person_id, question_id, answer_text,
            device_created_at, received_at, synced_late, organization_id, round_table_id, value_id)
          values (pg_temp.uid('ans:' || v_label || q.id), v_session, v_person, q.id,
                  case q.question_code
                    when 'por_que' then 'Me cuesta mantenerlo cuando estoy cansado, pero voy mejorando.'
                    when 'ejemplo' then (array['Mi mamá', 'Mi abuelo', 'Una compañera de trabajo', 'El pastor de mi iglesia', 'Mi hermana'])[1 + pg_temp.rnd(v_label || q.id) % 5]
                    else 'En una conversación difícil en casa.' end,
                  v_started + interval '14 minutes', v_received, v_late, v_org, v_table, v_value);
        end loop;

        v_base := 3 + pg_temp.rnd(v_person::text) % 5;  -- person's typical level 3..7
        v_initial := pg_temp.score(v_base + (pg_temp.rnd(v_label || 's') % 3) - 1, false);
        insert into public.member_assessments (id, session_id, person_id, kind, score,
          justification, device_created_at, received_at, synced_late,
          organization_id, round_table_id, value_id)
        values (pg_temp.uid('ini:' || v_label), v_session, v_person, 'initial', v_initial,
                'Lo vivo a medias; quiero ser más constante.', v_started + interval '16 minutes',
                v_received, v_late, v_org, v_table, v_value);

        if pg_temp.rnd(v_label || 'c') < 92 then
          insert into public.member_commitments (id, session_id, person_id, action_text, measure_text,
            device_created_at, received_at, synced_late, organization_id, round_table_id, value_id)
          values (pg_temp.uid('com:' || v_label), v_session, v_person,
                  'Practicar este valor en una situación concreta cada día de la semana.',
                  'Lo anotaré en mi celular cada noche (meta: 5 de 7 días).',
                  v_started + interval '22 minutes', v_received, v_late, v_org, v_table, v_value);
        end if;
      end loop;

      v_prev_session := v_session;
      v_prev_value := v_value;
    end loop;

    if t.scenario = 'closed' then
      -- Closed after its history (members cannot join a closed table).
      update public.round_tables set status = 'closed' where id = v_table;
    end if;

    -- Pending session (none for paused/closed tables).
    if t.scenario not in ('paused', 'closed') then
      v_slot := case
        when t.scenario in ('delayed', 'stale') then v_last_slot + interval '7 days'
        when t.scenario = 'esperanza' then v_last_slot + interval '7 days'
        else app.next_slot(v_table, t.weekday, t.start_time, t.tz, greatest(v_now, v_last_slot)) end;
      insert into public.sessions (id, organization_id, round_table_id, value_id, follow_up_value_id,
                                   status, stage, scheduled_at)
      values (pg_temp.uid('session:' || t.key || ':' || (t.history + 1)), v_org, v_table,
              pg_temp.uid('value:' || (t.history + 1)), v_prev_value, 'scheduled', 'lobby', v_slot);
    end if;
  end loop;
end;
$seed$;

-- coord@dev.local is also a member of Mesa Fe 01 (context switcher: Coordinador · Fundación Luz
-- and Miembro · Mesa Fe 01).
insert into public.table_members (id, organization_id, round_table_id, person_id, role, joined_at)
values (pg_temp.uid('tm:luz-01:coord'), pg_temp.uid('org:luz'), pg_temp.uid('table:luz-01'),
        pg_temp.uid('person:coord'), 'member', now() - interval '3 days');

-- A member who moved from Mesa Alba 02 to Mesa Camino 04 (history preserved).
update public.table_members set status = 'inactive', left_reason = 'moved',
  left_at = now() - interval '10 days', moved_to_round_table_id = pg_temp.uid('table:luz-04')
where id = pg_temp.uid('tm:luz-02:' || pg_temp.uid('person:luz-02:7'));
insert into public.table_members (id, organization_id, round_table_id, person_id, role, joined_at)
values (pg_temp.uid('tm:luz-04:moved'), pg_temp.uid('org:luz'), pg_temp.uid('table:luz-04'),
        pg_temp.uid('person:luz-02:7'), 'member', now() - interval '10 days');

-- ---------------------------------------------------------------------------------------------
-- Invites (Mesa Esperanza 03 shows every status; plus a coordinator and a facilitator invite)
-- ---------------------------------------------------------------------------------------------
insert into public.people (id, organization_id, first_name, last_name, email, phone, status) values
  (pg_temp.uid('person:rodrigo'), pg_temp.uid('org:luz'), 'Rodrigo', 'Paz', 'rodrigo.paz@seed.local', '+18095550016', 'invited'),
  (pg_temp.uid('person:isabela'), pg_temp.uid('org:luz'), 'Isabela', 'Núñez', 'isabela.nunez@seed.local', '+18095550017', 'invited'),
  (pg_temp.uid('person:mateo'), pg_temp.uid('org:luz'), 'Mateo', 'Vargas', null, '+18095550018', 'invited'),
  (pg_temp.uid('person:daniela'), pg_temp.uid('org:luz'), 'Daniela', 'Cruz', 'daniela.cruz@seed.local', '+18095550019', 'invited');

insert into public.table_members (id, organization_id, round_table_id, person_id, role, joined_at, status, left_at, left_reason) values
  (pg_temp.uid('tm:luz-03:rodrigo'), pg_temp.uid('org:luz'), pg_temp.uid('table:luz-03'), pg_temp.uid('person:rodrigo'), 'member', now() - interval '2 days', 'active', null, null),
  (pg_temp.uid('tm:luz-03:isabela'), pg_temp.uid('org:luz'), pg_temp.uid('table:luz-03'), pg_temp.uid('person:isabela'), 'member', now() - interval '20 days', 'active', null, null);
insert into public.table_members (id, organization_id, round_table_id, person_id, role, joined_at, status, left_at, left_reason)
values (pg_temp.uid('tm:luz-03:mateo'), pg_temp.uid('org:luz'), pg_temp.uid('table:luz-03'), pg_temp.uid('person:mateo'), 'member', now() - interval '15 days', 'active', null, null);
update public.table_members set status = 'inactive', left_reason = 'invite_revoked', left_at = now() - interval '12 days'
where id = pg_temp.uid('tm:luz-03:mateo');
update public.people set status = 'inactive' where id = pg_temp.uid('person:mateo');

insert into public.role_assignments (id, person_id, role, organization_id, granted_by_person_id)
values (pg_temp.uid('role:daniela'), pg_temp.uid('person:daniela'), 'coordinator', pg_temp.uid('org:luz'), pg_temp.uid('person:admin'));

insert into public.invites (id, organization_id, person_id, code, role_kind, round_table_id,
                            invited_by_person_id, status, expires_at, accepted_at,
                            accepted_auth_user_id, revoked_at, revoked_by_person_id, created_at) values
  (pg_temp.uid('invite:rodrigo'), pg_temp.uid('org:luz'), pg_temp.uid('person:rodrigo'), 'MESA34', 'member',
   pg_temp.uid('table:luz-03'), pg_temp.uid('person:facil'), 'pending', now() + interval '12 days', null, null, null, null, now() - interval '2 days'),
  (pg_temp.uid('invite:isabela'), pg_temp.uid('org:luz'), pg_temp.uid('person:isabela'), 'VENC22', 'member',
   pg_temp.uid('table:luz-03'), pg_temp.uid('person:facil'), 'pending', now() - interval '6 days', null, null, null, null, now() - interval '20 days'),
  (pg_temp.uid('invite:mateo'), pg_temp.uid('org:luz'), pg_temp.uid('person:mateo'), 'REVK23', 'member',
   pg_temp.uid('table:luz-03'), pg_temp.uid('person:facil'), 'revoked', now() + interval '1 day', null, null, now() - interval '12 days', pg_temp.uid('person:facil'), now() - interval '15 days'),
  (pg_temp.uid('invite:ana'), pg_temp.uid('org:luz'), pg_temp.uid('person:ana'), 'ACEP24', 'member',
   pg_temp.uid('table:luz-03'), pg_temp.uid('person:facil'), 'accepted', now() + interval '1 day', now() - interval '60 days', pg_temp.uid('user:ana'), null, null, now() - interval '62 days'),
  (pg_temp.uid('invite:daniela'), pg_temp.uid('org:luz'), pg_temp.uid('person:daniela'), 'CRDN26', 'coordinator',
   null, pg_temp.uid('person:admin'), 'pending', now() + interval '10 days', null, null, null, null, now() - interval '4 days'),
  (pg_temp.uid('invite:rosa'), pg_temp.uid('org:luz'), pg_temp.uid('person:luz-07:0'), 'FACL27', 'facilitator',
   pg_temp.uid('table:luz-07'), pg_temp.uid('person:coord'), 'pending', now() + interval '14 days', null, null, null, null, now() - interval '1 day');

-- A few audit events so the Auditoría tab is not empty.
insert into public.audit_events (organization_id, actor_auth_user_id, actor_person_id, event_type,
                                 entity_type, entity_id, payload, created_at) values
  (pg_temp.uid('org:luz'), pg_temp.uid('user:admin'), pg_temp.uid('person:admin'), 'organization.created', 'organization', pg_temp.uid('org:luz'), '{"name":"Fundación Luz"}', now() - interval '120 days'),
  (pg_temp.uid('org:luz'), pg_temp.uid('user:coord'), pg_temp.uid('person:coord'), 'table.created', 'round_table', pg_temp.uid('table:luz-03'), '{"code":"LUZ-03"}', now() - interval '70 days'),
  (pg_temp.uid('org:luz'), pg_temp.uid('user:facil'), pg_temp.uid('person:facil'), 'invite.created', 'invite', pg_temp.uid('invite:rodrigo'), '{"role_kind":"member"}', now() - interval '2 days'),
  (pg_temp.uid('org:luz'), pg_temp.uid('user:facil'), pg_temp.uid('person:facil'), 'invite.revoked', 'invite', pg_temp.uid('invite:mateo'), '{}', now() - interval '12 days'),
  (pg_temp.uid('org:luz'), pg_temp.uid('user:coord'), pg_temp.uid('person:coord'), 'member.moved', 'table_member', pg_temp.uid('tm:luz-02:' || pg_temp.uid('person:luz-02:7')), '{}', now() - interval '10 days'),
  (pg_temp.uid('org:horizonte'), pg_temp.uid('user:admin'), pg_temp.uid('person:admin'), 'organization.created', 'organization', pg_temp.uid('org:horizonte'), '{"name":"Colegio Horizonte"}', now() - interval '110 days'),
  (pg_temp.uid('org:andina'), pg_temp.uid('user:admin'), pg_temp.uid('person:admin'), 'organization.created', 'organization', pg_temp.uid('org:andina'), '{"name":"Empresa Andina"}', now() - interval '100 days');

select set_config('app.seeding', 'off', false);
select public.refresh_kpis();
