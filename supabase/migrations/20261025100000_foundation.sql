-- Gold Roundtables — foundation: schemas, extensions, enums, shared trigger helpers.
--
-- Schemas
--   public : tables (RLS on every one) and the read-only RPCs the app calls through PostgREST.
--   app    : private helpers used by RLS policies, triggers and the api layer. Not exposed.
--   api    : business operations (writes) executed only by service_role from Edge Functions.
--   kpi    : KPI rollups (materialized views). Read through public.kpi_* RPCs only.

create extension if not exists pgcrypto with schema extensions;

create schema if not exists app;
create schema if not exists api;
create schema if not exists kpi;

revoke all on schema app, api, kpi from public;
grant usage on schema app to authenticated, service_role;
grant usage on schema api to service_role;
grant usage on schema kpi to service_role;

-- ---------------------------------------------------------------------------------------------
-- Enums. Values are the serialized wire values used by PowerSync, PostgREST and Edge Functions.
-- ---------------------------------------------------------------------------------------------
create type public.organization_status as enum ('active', 'paused', 'inactive');
create type public.record_status as enum ('active', 'inactive');
create type public.person_status as enum ('invited', 'active', 'inactive');
create type public.role_kind as enum ('platform_admin', 'coordinator');
create type public.round_table_status as enum ('active', 'paused', 'completed', 'closed');
create type public.table_member_role as enum ('facilitator', 'member');
create type public.session_status as enum ('scheduled', 'open', 'closed', 'cancelled');
create type public.session_stage as enum
  ('lobby', 'attendance', 'follow_up', 'value', 'commitment', 'closed');
create type public.attendance_status as enum ('present', 'absent', 'late', 'excused');
create type public.attendance_source as enum ('facilitator', 'auto_submission');
create type public.assessment_kind as enum ('initial', 'follow_up');
create type public.commitment_follow_up_status as enum ('kept', 'partial', 'not_kept');
create type public.invite_role_kind as enum ('coordinator', 'facilitator', 'member');
create type public.invite_status as enum ('pending', 'accepted', 'expired', 'revoked');
create type public.device_platform as enum ('android', 'ios', 'web');
create type public.notification_kind as enum
  ('session_reminder', 'commitment_nudge', 'stage_opened');
create type public.notification_status as enum ('pending', 'sent', 'skipped', 'failed');

-- ---------------------------------------------------------------------------------------------
-- Shared trigger helpers
-- ---------------------------------------------------------------------------------------------

-- Keeps updated_at current on every UPDATE.
create or replace function app.touch_updated_at()
returns trigger
language plpgsql
set search_path = ''
as $$
begin
  new.updated_at := now();
  return new;
end;
$$;

-- Seed scripts set `app.seeding = on` to insert historical rows (closed sessions, late uploads)
-- without firing the side-effect triggers that only make sense for live traffic. Invariant
-- checks (score, seats, follow-up uniqueness) are never skipped.
create or replace function app.is_seeding()
returns boolean
language sql
stable
set search_path = ''
as $$
  select coalesce(current_setting('app.seeding', true), 'off') = 'on';
$$;

-- Raises a business-rule violation with a stable English code in MESSAGE and Spanish,
-- user-facing text in DETAIL. Edge Functions map the code to HTTP status and pass DETAIL through.
create or replace function app.fail(p_code text, p_detail text, p_hint text default null)
returns void
language plpgsql
set search_path = ''
as $$
begin
  raise exception using
    errcode = 'P0001',
    message = p_code,
    detail = p_detail,
    hint = coalesce(p_hint, '');
end;
$$;
