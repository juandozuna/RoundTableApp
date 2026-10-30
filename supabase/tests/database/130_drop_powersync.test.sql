-- PowerSync backend pieces are gone (ADR 0019): publication, replication role and slots.
--
-- On a fresh database the checks alone pass vacuously (nothing ever created these objects), so the
-- test first rebuilds the state the old migration and scripts/setup-powersync-replication.sh left
-- behind, runs the body of 20261101000000_drop_powersync.sql against it twice (idempotent) and
-- only then asserts it is gone.
--
-- The migration body is copied into pg_temp.drop_powersync() below because a pgTAP file cannot
-- include another file portably; keep both in step. Everything is rolled back with the test
-- transaction except the replication slot, which is not transactional: it is created here and
-- dropped by the migration body under test, and any leftover from an aborted run is removed first.
-- Creating a replication role needs a superuser (the local stack's `postgres`).
begin;
create extension if not exists pgtap with schema extensions;
select plan(15);

-- ---------------------------------------------------------------------------------------------
-- Arrange: the old state.
-- ---------------------------------------------------------------------------------------------
do $$
begin
  perform pg_catalog.pg_drop_replication_slot(slot_name)
    from pg_catalog.pg_replication_slots where slot_name = 'powersync_pgtap_slot';
end
$$;
drop publication if exists powersync;

create role powersync_role with replication bypassrls login;
grant usage on schema public to powersync_role;
grant select on all tables in schema public to powersync_role;
alter default privileges in schema public grant select on tables to powersync_role;

create publication powersync for table
  public.curriculum_modules, public.curriculum_values, public.value_questions,
  public.organizations, public.locations, public.people, public.role_assignments,
  public.round_tables, public.table_members, public.sessions, public.session_attendance,
  public.member_assessments, public.member_answers, public.member_commitments;

do $$
begin
  perform pg_catalog.pg_create_physical_replication_slot('powersync_pgtap_slot');
end
$$;

-- Proves the default privilege: a table created after the grant is readable by the role.
create table public.zz_powersync_probe (id int);
create temp table zz_powersync_role as select oid as id from pg_catalog.pg_roles where rolname = 'powersync_role';

select is((select count(*) from pg_catalog.pg_publication where pubname = 'powersync'), 1::bigint,
          'arranged: the powersync publication exists');
select is((select count(*) from pg_catalog.pg_roles where rolname = 'powersync_role'), 1::bigint,
          'arranged: the powersync_role replication role exists');
select ok(has_table_privilege('powersync_role', 'public.sessions', 'select')
          and has_table_privilege('powersync_role', 'public.zz_powersync_probe', 'select'),
          'arranged: the role can read existing and new tables');
select is((select count(*) from pg_catalog.pg_replication_slots where slot_name like 'powersync%'),
          1::bigint, 'arranged: a powersync replication slot exists');

-- ---------------------------------------------------------------------------------------------
-- Act: the migration body (statements verbatim from 20261101000000_drop_powersync.sql).
-- ---------------------------------------------------------------------------------------------
create function pg_temp.drop_powersync() returns void language plpgsql as $fn$
declare
  v_slot record;
begin
  drop publication if exists powersync;

  for v_slot in
    select slot_name, active_pid from pg_catalog.pg_replication_slots where slot_name like 'powersync%'
  loop
    begin
      if v_slot.active_pid is not null then
        perform pg_catalog.pg_terminate_backend(v_slot.active_pid);
        perform pg_catalog.pg_sleep(0.5);
      end if;
      perform pg_catalog.pg_drop_replication_slot(v_slot.slot_name);
    exception when others then
      raise warning 'could not drop replication slot %: % (drop it by hand: select pg_drop_replication_slot(%))',
        v_slot.slot_name, sqlerrm, quote_literal(v_slot.slot_name);
    end;
  end loop;

  if exists (select 1 from pg_catalog.pg_roles where rolname = 'powersync_role') then
    begin
      alter default privileges in schema public revoke select on tables from powersync_role;
      revoke select on all tables in schema public from powersync_role;
      revoke usage on schema public from powersync_role;
      drop owned by powersync_role;
      drop role powersync_role;
    exception when insufficient_privilege then
      raise warning 'could not drop role powersync_role: % (drop it by hand with: drop owned by powersync_role; drop role powersync_role;)', sqlerrm;
    end;
  end if;
end;
$fn$;

select lives_ok($$select pg_temp.drop_powersync()$$, 'the migration body runs on the old state');

-- ---------------------------------------------------------------------------------------------
-- Assert: gone.
-- ---------------------------------------------------------------------------------------------
select is((select count(*) from pg_catalog.pg_publication where pubname = 'powersync'), 0::bigint,
          'the powersync publication does not exist');
select is((select count(*) from pg_catalog.pg_roles where rolname = 'powersync_role'), 0::bigint,
          'the powersync_role replication role does not exist');
select is((select count(*) from pg_catalog.pg_replication_slots where slot_name like 'powersync%'),
          0::bigint, 'no powersync replication slot is left');
select is((select count(*)
             from pg_catalog.pg_default_acl d, aclexplode(d.defaclacl) a
            where a.grantee in (select id from zz_powersync_role)),
          0::bigint, 'no default privilege for the role is left behind');
select is((select count(*)
             from pg_catalog.pg_class c, aclexplode(c.relacl) a
            where a.grantee in (select id from zz_powersync_role)),
          0::bigint, 'no table grant for the role is left behind');
select is((select count(*)
             from pg_catalog.pg_namespace n, aclexplode(n.nspacl) a
            where a.grantee in (select id from zz_powersync_role)),
          0::bigint, 'no schema grant for the role is left behind');

-- Idempotent: nothing left to drop, nothing fails.
select lives_ok($$select pg_temp.drop_powersync()$$, 'running the migration body again is a no-op');
select is((select count(*) from pg_catalog.pg_roles where rolname = 'powersync_role')
          + (select count(*) from pg_catalog.pg_publication where pubname = 'powersync')
          + (select count(*) from pg_catalog.pg_replication_slots where slot_name like 'powersync%'),
          0::bigint, 'still gone after the second run');

-- The tables the publication covered are untouched.
select has_table('public', 'sessions', 'dropping the publication leaves the tables');
select has_table('public', 'zz_powersync_probe', 'and the probe table');

select * from finish();
rollback;
