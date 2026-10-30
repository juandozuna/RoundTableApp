-- PowerSync backend pieces are gone (ADR 0019): publication, replication role and slots.
begin;
create extension if not exists pgtap with schema extensions;
select plan(3);

select is((select count(*) from pg_catalog.pg_publication where pubname = 'powersync'), 0::bigint,
          'the powersync publication does not exist');
select is((select count(*) from pg_catalog.pg_roles where rolname = 'powersync_role'), 0::bigint,
          'the powersync_role replication role does not exist');
select is((select count(*) from pg_catalog.pg_replication_slots where slot_name like 'powersync%'),
          0::bigint, 'no powersync replication slot is left');

select * from finish();
rollback;
