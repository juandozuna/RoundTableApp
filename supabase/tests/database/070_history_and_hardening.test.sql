-- History preservation, audit coverage and defence in depth.
begin;
create extension if not exists pgtap with schema extensions;
select plan(14);

create function pg_temp.u(p text) returns uuid language sql immutable as
  $$ select md5('gold-roundtables:user:' || p)::uuid $$;
create function pg_temp.id(p text) returns uuid language sql immutable as
  $$ select md5('gold-roundtables:' || p)::uuid $$;
create function pg_temp.err(p_sql text) returns text language plpgsql as $$
begin
  execute p_sql;
  return null;
exception when others then
  return sqlerrm;
end;
$$;

-- ── The audit trail is append-only ─────────────────────────────────────────────────────────────
select throws_ok($$update public.audit_events set event_type = 'x'$$, '42501', 'audit_events is append-only',
                 'audit events cannot be edited, even by the owner role');
select throws_ok($$delete from public.audit_events$$, '42501', 'audit_events is append-only',
                 'audit events cannot be deleted');
select throws_ok($$truncate public.audit_events$$, '42501', 'audit_events is append-only',
                 'audit events cannot be truncated');

-- ── Profile edits are audited ──────────────────────────────────────────────────────────────────
select api.profile_update(pg_temp.u('ana'), '{"phone":"+18095550123"}') is not null as ok \gset
select is((select payload->>'self' || ':' || (payload->'fields')::text from public.audit_events
           where event_type = 'person.updated' and entity_id = pg_temp.id('person:ana')
           order by created_at desc limit 1),
          'true:["phone"]', 'a self-service profile edit is audited with the fields that changed');

-- ── Moving a member takes their pending invite along ──────────────────────────────────────────
create temp table t_invite as
select api.invite_create(pg_temp.u('coord'), jsonb_build_object(
  'role_kind', 'member', 'round_table_id', pg_temp.id('table:luz-07'),
  'person', jsonb_build_object('first_name', 'Mover', 'last_name', 'Prueba'))) as j;
create temp table t_move as
select api.member_move(pg_temp.u('coord'), jsonb_build_object(
  'table_member_id', (select id from public.table_members
                      where round_table_id = pg_temp.id('table:luz-07') and status = 'active'
                        and person_id = (select (j->'person'->>'id')::uuid from t_invite)),
  'to_round_table_id', pg_temp.id('table:luz-04'))) as j;
select is((select round_table_id from public.invites where id = (select (j->>'id')::uuid from t_invite)),
          pg_temp.id('table:luz-04'), 'the pending invite now points at the table the member was moved to');
select is((select count(*)::int from public.table_members
           where person_id = (select (j->'person'->>'id')::uuid from t_invite) and status = 'active'
             and round_table_id = pg_temp.id('table:luz-04')), 1, 'the member sits at the new table');
select is((select left_reason::text from public.table_members
           where person_id = (select (j->'person'->>'id')::uuid from t_invite)
             and round_table_id = pg_temp.id('table:luz-07')), 'moved', 'the old membership is kept as history');
select is((select (payload->>'invites_moved')::int from public.audit_events
           where event_type = 'member.moved' order by created_at desc limit 1), 1,
          'the move audit event records the re-pointed invite');

-- ── Coordinator location stays informational but must belong to the organization ───────────────
select is(pg_temp.err(format($$select api.role_grant(%L, %L)$$, pg_temp.u('admin'), jsonb_build_object(
            'person_id', pg_temp.id('person:ana'), 'role', 'coordinator',
            'location_id', pg_temp.id('loc:hor-norte')))),
          'validation_failed', 'a location of another organization is rejected');
select is((api.role_grant(pg_temp.u('admin'), jsonb_build_object(
            'person_id', pg_temp.id('person:ana'), 'role', 'coordinator',
            'location_id', pg_temp.id('loc:luz-central'))))->>'location_id',
          pg_temp.id('loc:luz-central')::text, 'a location of the same organization is stored');
select set_config('request.jwt.claims', json_build_object('sub', pg_temp.u('ana'), 'role', 'authenticated')::text, true);
set local role authenticated;
select ok((select count(*) from public.round_tables where location_id = pg_temp.id('loc:luz-santiago')) > 0,
          'a coordinator tagged with one location still sees the tables of the others (organization-wide in v1)');
reset role;

-- ── Internal helpers are not callable by API roles ─────────────────────────────────────────────
select ok(not has_function_privilege('authenticated', 'app.audit(uuid, uuid, uuid, text, text, uuid, jsonb)', 'execute')
      and not has_function_privilege('authenticated', 'app.schedule_next_session(uuid, timestamptz)', 'execute')
      and not has_function_privilege('anon', 'app.create_invite(uuid, uuid, public.people, public.invite_role_kind, uuid, integer)', 'execute')
      and not has_function_privilege('authenticated', 'kpi.mark_dirty()', 'execute'),
      'write-capable SECURITY DEFINER helpers are not executable by API roles');
select ok(has_function_privilege('authenticated', 'app.my_person_ids()', 'execute')
      and has_function_privilege('authenticated', 'app.coordinator_orgs()', 'execute')
      and has_function_privilege('authenticated', 'app.facilitator_tables()', 'execute'),
      'the scope helpers used by RLS policies stay executable');
select ok(has_function_privilege('service_role', 'api.sync_apply(uuid, jsonb)', 'execute')
      and not has_function_privilege('authenticated', 'api.sync_apply(uuid, jsonb)', 'execute'),
      'api.* stays service-role only');

select * from finish();
rollback;
