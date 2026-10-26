-- Gold Roundtables — server-side rate limiting for anonymous endpoints (invite preview).
--
-- Fixed-window counters keyed by an opaque bucket string (e.g. 'invite_preview:ip:203.0.113.7').
-- The Edge Function calls api.rate_limit_hit before doing the work and answers 429 when the
-- bucket is over its allowance. The counter is incremented in its own call (it must survive the
-- rejection), so this function never raises for "limited": it reports it.

create table if not exists app.rate_limit_hits (
  bucket text not null,
  window_start timestamptz not null,
  hits integer not null default 0,
  primary key (bucket, window_start)
);

-- Internal bookkeeping: no direct access from API roles.
alter table app.rate_limit_hits enable row level security;
revoke all on app.rate_limit_hits from public, anon, authenticated;

create or replace function api.rate_limit_hit(p_bucket text, p_max integer, p_window_seconds integer)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_window timestamptz;
  v_hits integer;
begin
  if p_bucket is null or length(p_bucket) = 0 or length(p_bucket) > 200
     or p_max < 1 or p_window_seconds < 1 then
    perform app.fail('validation_failed', 'Parámetros de límite no válidos.');
  end if;

  v_window := to_timestamp(floor(extract(epoch from now()) / p_window_seconds) * p_window_seconds);

  insert into app.rate_limit_hits as h (bucket, window_start, hits)
  values (p_bucket, v_window, 1)
  on conflict (bucket, window_start) do update set hits = h.hits + 1
  returning h.hits into v_hits;

  -- Old windows are useless; sweep them occasionally instead of needing another cron job.
  if random() < 0.02 then
    delete from app.rate_limit_hits where window_start < now() - interval '1 day';
  end if;

  return jsonb_build_object(
    'allowed', v_hits <= p_max,
    'hits', v_hits,
    'retry_after_seconds',
      case when v_hits <= p_max then 0
           else greatest(1, ceil(extract(epoch from (v_window + make_interval(secs => p_window_seconds) - now())))::integer) end);
end;
$$;

revoke all on function api.rate_limit_hit(text, integer, integer) from public, anon, authenticated;
grant execute on function api.rate_limit_hit(text, integer, integer) to service_role;
