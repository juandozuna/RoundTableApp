-- Gold Roundtables — remove the PowerSync backend pieces (ADR 0019, supersedes ADR 0004).
--
-- The app reads through PostgREST under RLS and writes through the `sync-upload` Edge Function, so
-- nothing replicates the database any more. This reverses what 20261025100700_notifications_cron_sync.sql
-- (the `powersync` publication) and the former scripts/setup-powersync-replication.sh (the
-- `powersync_role` login role and its grants) created. Idempotent.
--
-- The role is cluster-wide and only exists where that script ran (local dev stack, hosted
-- project). On hosted Supabase `postgres` is not a superuser; it can drop a role it created
-- (CREATEROLE). If a step is not permitted the migration warns instead of failing the deploy; the
-- pgTAP test 130_drop_powersync.test.sql then fails until it is done by hand.

drop publication if exists powersync;

do $drop$
declare
  v_slot record;
begin
  -- A leftover logical replication slot would keep retaining WAL.
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
      -- Mirror of the setup: usage on public, select on all tables and as a default privilege.
      alter default privileges in schema public revoke select on tables from powersync_role;
      revoke select on all tables in schema public from powersync_role;
      revoke usage on schema public from powersync_role;
      -- Anything left (other schemas, default ACLs set by other owners); owns nothing.
      drop owned by powersync_role;
      drop role powersync_role;
    exception when insufficient_privilege then
      raise warning 'could not drop role powersync_role: % (drop it by hand with: drop owned by powersync_role; drop role powersync_role;)', sqlerrm;
    end;
  end if;
end;
$drop$;
