-- Gold Roundtables — notification outbox (ADR 0009), scheduled jobs, sync window and the
-- PowerSync publication (ADR 0004).

-- ---------------------------------------------------------------------------------------------
-- Notification outbox. SQL decides *who* gets *what* (testable, idempotent through dedupe_key);
-- the notifications Edge Function drains it and talks to FCM.
-- ---------------------------------------------------------------------------------------------
create table public.notification_outbox (
  id uuid primary key default gen_random_uuid(),
  kind public.notification_kind not null,
  auth_user_id uuid not null references auth.users (id) on delete cascade,
  person_id uuid references public.people (id),
  organization_id uuid references public.organizations (id),
  title text not null,
  body text not null,
  data jsonb not null default '{}'::jsonb,
  dedupe_key text not null unique,
  status public.notification_status not null default 'pending',
  attempts smallint not null default 0,
  last_error text,
  send_after timestamptz not null default now(),
  sent_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index notification_outbox_pending_idx on public.notification_outbox (send_after)
  where status = 'pending';
create trigger notification_outbox_touch before update on public.notification_outbox
  for each row execute function app.touch_updated_at();

alter table public.notification_outbox enable row level security;
-- No policies: service_role only.
revoke all on public.notification_outbox from anon, authenticated;
grant all on public.notification_outbox to service_role;

-- Session reminder (P-53): participants of tables with a session in the next p_lead.
create or replace function app.enqueue_session_reminders(p_lead interval default interval '24 hours')
returns integer
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_count integer;
begin
  insert into public.notification_outbox (kind, auth_user_id, person_id, organization_id, title,
                                          body, data, dedupe_key)
  select 'session_reminder', tm.auth_user_id, tm.person_id, s.organization_id,
         'Tu mesa se reúne pronto',
         rt.name || ' · Valor ' || cv.sequence || ' · ' || cv.name || ' · '
           || to_char(s.scheduled_at at time zone rt.timezone, 'DD/MM HH24:MI'),
         jsonb_build_object('type', 'session_reminder', 'session_id', s.id,
                            'round_table_id', rt.id, 'scheduled_at', s.scheduled_at),
         'session_reminder:' || s.id || ':' || tm.person_id
  from public.sessions s
  join public.round_tables rt on rt.id = s.round_table_id and rt.status = 'active'
  join public.curriculum_values cv on cv.id = s.value_id
  join public.table_members tm on tm.round_table_id = rt.id and tm.status = 'active'
    and tm.auth_user_id is not null
  where s.status = 'scheduled' and s.scheduled_at between now() and now() + p_lead
  on conflict (dedupe_key) do nothing;
  get diagnostics v_count = row_count;
  return v_count;
end;
$$;

-- Mid-week commitment nudge (ADR 0009 #2): 3 days after a closed session, for commitments
-- whose follow-up has not happened yet.
create or replace function app.enqueue_commitment_nudges()
returns integer
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_count integer;
begin
  insert into public.notification_outbox (kind, auth_user_id, person_id, organization_id, title,
                                          body, data, dedupe_key)
  select 'commitment_nudge', p.auth_user_id, c.person_id, c.organization_id,
         'Tu compromiso de esta semana',
         left(c.action_text, 140),
         jsonb_build_object('type', 'commitment_nudge', 'commitment_id', c.id,
                            'session_id', c.session_id, 'round_table_id', c.round_table_id),
         'commitment_nudge:' || c.id
  from public.member_commitments c
  join public.sessions s on s.id = c.session_id and s.status = 'closed'
  join public.people p on p.id = c.person_id and p.auth_user_id is not null
  where c.follow_up_status is null
    and s.ended_at between now() - interval '4 days' and now() - interval '3 days'
  on conflict (dedupe_key) do nothing;
  get diagnostics v_count = row_count;
  return v_count;
end;
$$;

-- Stage opened (online only, ADR 0009 #4): everyone at the table except the facilitator.
create or replace function app.enqueue_stage_opened(p_session_id uuid)
returns integer
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_count integer;
begin
  insert into public.notification_outbox (kind, auth_user_id, person_id, organization_id, title,
                                          body, data, dedupe_key)
  select 'stage_opened', tm.auth_user_id, tm.person_id, s.organization_id,
         'La mesa avanzó',
         case s.stage
           when 'attendance' then 'Estamos pasando lista.'
           when 'follow_up' then 'Abrimos el seguimiento de tu compromiso.'
           when 'value' then 'Abrimos el valor de hoy: responde y ponte tu puntaje.'
           when 'commitment' then 'Es momento de escribir tu compromiso.'
           else 'La sesión cambió de etapa.' end,
         jsonb_build_object('type', 'stage_opened', 'session_id', s.id,
                            'round_table_id', s.round_table_id, 'stage', s.stage),
         'stage_opened:' || s.id || ':' || s.stage || ':' || tm.person_id
  from public.sessions s
  join public.table_members tm on tm.round_table_id = s.round_table_id and tm.status = 'active'
    and tm.role = 'member' and tm.auth_user_id is not null
  where s.id = p_session_id and s.status = 'open'
  on conflict (dedupe_key) do nothing;
  get diagnostics v_count = row_count;
  return v_count;
end;
$$;

create or replace function api.notifications_enqueue(p_kind text, p_session_id uuid default null)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
begin
  return jsonb_build_object('enqueued', case p_kind
    when 'session_reminder' then app.enqueue_session_reminders()
    when 'commitment_nudge' then app.enqueue_commitment_nudges()
    when 'stage_opened' then app.enqueue_stage_opened(p_session_id)
    else 0 end);
end;
$$;

-- Claims pending notifications for sending, with the recipient's device tokens.
create or replace function api.notifications_claim(p_limit integer default 100)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_rows jsonb;
begin
  with claimed as (
    select id from public.notification_outbox
    where status = 'pending' and send_after <= now() and attempts < 5
    order by send_after
    limit greatest(1, least(p_limit, 500))
    for update skip locked
  ), updated as (
    update public.notification_outbox o set attempts = o.attempts + 1
    from claimed where o.id = claimed.id
    returning o.*
  )
  select coalesce(jsonb_agg(jsonb_build_object(
    'id', u.id, 'kind', u.kind, 'title', u.title, 'body', u.body, 'data', u.data,
    'tokens', coalesce((select jsonb_agg(jsonb_build_object('token', d.token, 'platform', d.platform))
                        from public.device_tokens d where d.auth_user_id = u.auth_user_id),
                       '[]'::jsonb))), '[]'::jsonb)
  into v_rows
  from updated u;
  return v_rows;
end;
$$;

-- p_results: [{id, status: sent|skipped|failed, error?}], p_invalid_tokens: [token, ...]
create or replace function api.notifications_complete(p_results jsonb, p_invalid_tokens jsonb default '[]')
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_updated integer;
  v_removed integer;
begin
  update public.notification_outbox o set
    status = case when r.status = 'failed' and o.attempts < 5 then 'pending'::public.notification_status
                  else r.status::public.notification_status end,
    last_error = r.error,
    sent_at = case when r.status = 'sent' then now() else o.sent_at end,
    send_after = case when r.status = 'failed' then now() + interval '10 minutes' else o.send_after end
  from jsonb_to_recordset(p_results) as r(id uuid, status text, error text)
  where o.id = r.id;
  get diagnostics v_updated = row_count;
  delete from public.device_tokens
  where token in (select jsonb_array_elements_text(coalesce(p_invalid_tokens, '[]'::jsonb)));
  get diagnostics v_removed = row_count;
  return jsonb_build_object('updated', v_updated, 'tokens_removed', v_removed);
end;
$$;

revoke all on function api.notifications_enqueue(text, uuid), api.notifications_claim(integer),
  api.notifications_complete(jsonb, jsonb) from public, anon, authenticated;
grant execute on function api.notifications_enqueue(text, uuid), api.notifications_claim(integer),
  api.notifications_complete(jsonb, jsonb) to service_role;

-- ---------------------------------------------------------------------------------------------
-- Sync window (ADR 0005: devices work 7 days offline). Session rows leave the device buckets
-- (archived_at set) 8 weeks after the session closed — except the latest closed session of
-- each table, whose commitments are needed for the next follow-up. History stays on the
-- server and in the online KPI screens.
-- ---------------------------------------------------------------------------------------------
create or replace function app.archive_old_session_data(p_window interval default interval '56 days')
returns integer
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_ids uuid[];
begin
  select array_agg(s.id) into v_ids
  from public.sessions s
  where s.archived_at is null
    and s.status in ('closed', 'cancelled')
    and coalesce(s.ended_at, s.scheduled_at) < now() - p_window
    and exists (select 1 from public.sessions later
                where later.round_table_id = s.round_table_id and later.status = 'closed'
                  and later.ended_at > coalesce(s.ended_at, s.scheduled_at));
  if v_ids is null then
    return 0;
  end if;
  update public.session_attendance set archived_at = now() where session_id = any (v_ids) and archived_at is null;
  update public.member_assessments set archived_at = now() where session_id = any (v_ids) and archived_at is null;
  update public.member_answers set archived_at = now() where session_id = any (v_ids) and archived_at is null;
  update public.member_commitments set archived_at = now() where session_id = any (v_ids) and archived_at is null;
  -- archived_at is not guarded by the finalized-session check (app.sessions_prepare).
  update public.sessions set archived_at = now() where id = any (v_ids);
  return coalesce(array_length(v_ids, 1), 0);
end;
$$;

create or replace function app.expire_invites()
returns integer
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_count integer;
begin
  update public.invites set status = 'expired' where status = 'pending' and expires_at < now();
  get diagnostics v_count = row_count;
  return v_count;
end;
$$;

-- Makes sure every active table has its pending session (e.g. after a manual data fix).
create or replace function app.ensure_pending_sessions()
returns integer
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_table uuid;
  v_count integer := 0;
begin
  for v_table in
    select rt.id from public.round_tables rt
    where rt.status = 'active'
      and not exists (select 1 from public.sessions s
                      where s.round_table_id = rt.id and s.status in ('scheduled', 'open'))
  loop
    perform app.schedule_next_session(v_table, now());
    v_count := v_count + 1;
  end loop;
  return v_count;
end;
$$;

-- Calls the notifications Edge Function dispatcher through pg_net when configured in Vault
-- (secrets `functions_base_url` and `cron_secret`); otherwise the outbox simply waits for an
-- external caller of POST /functions/v1/notifications/dispatch.
create or replace function app.dispatch_notifications_http()
returns void
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_url text;
  v_secret text;
begin
  if not exists (select 1 from pg_catalog.pg_extension where extname = 'pg_net')
     or not exists (select 1 from pg_catalog.pg_namespace where nspname = 'vault') then
    return;
  end if;
  execute $q$select decrypted_secret from vault.decrypted_secrets where name = 'functions_base_url'$q$
    into v_url;
  execute $q$select decrypted_secret from vault.decrypted_secrets where name = 'cron_secret'$q$
    into v_secret;
  if v_url is null or v_secret is null then
    return;
  end if;
  execute 'select net.http_post(url := $1, headers := $2, body := $3)'
    using v_url || '/notifications/dispatch',
          jsonb_build_object('Content-Type', 'application/json', 'x-cron-secret', v_secret),
          '{}'::jsonb;
end;
$$;

-- ---------------------------------------------------------------------------------------------
-- pg_cron schedule (guarded: skipped where pg_cron is unavailable)
-- ---------------------------------------------------------------------------------------------
do $cron$
begin
  begin
    create extension if not exists pg_cron;
  exception when others then
    raise notice 'pg_cron unavailable (%); KPI refresh and reminders must be triggered externally', sqlerrm;
    return;
  end;

  perform cron.schedule('gr-kpi-refresh-dirty', '*/5 * * * *', 'select kpi.refresh_if_dirty()');
  perform cron.schedule('gr-kpi-refresh-hourly', '7 * * * *', 'select public.refresh_kpis()');
  perform cron.schedule('gr-session-reminders', '*/15 * * * *',
                        'select app.enqueue_session_reminders(); select app.dispatch_notifications_http()');
  perform cron.schedule('gr-commitment-nudges', '0 * * * *',
                        'select app.enqueue_commitment_nudges(); select app.dispatch_notifications_http()');
  perform cron.schedule('gr-invites-expire', '20 * * * *', 'select app.expire_invites()');
  perform cron.schedule('gr-pending-sessions', '40 * * * *', 'select app.ensure_pending_sessions()');
  perform cron.schedule('gr-archive-sessions', '30 3 * * *', 'select app.archive_old_session_data()');
end;
$cron$;

-- ---------------------------------------------------------------------------------------------
-- PowerSync logical replication publication. Only tables referenced by powersync/sync-rules.yaml.
-- The replication role is created by the local-stack setup (see powersync/README.md); it is not
-- created here because it needs a password.
-- ---------------------------------------------------------------------------------------------
do $pub$
begin
  if not exists (select 1 from pg_catalog.pg_publication where pubname = 'powersync') then
    create publication powersync for table
      public.curriculum_modules, public.curriculum_values, public.value_questions,
      public.organizations, public.locations, public.people, public.role_assignments,
      public.round_tables, public.table_members, public.sessions, public.session_attendance,
      public.member_assessments, public.member_answers, public.member_commitments;
  end if;
end;
$pub$;
