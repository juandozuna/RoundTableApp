-- Gold Roundtables — table program position (RF-28, issue #5).
-- api.table_update validates current_value_id: it must be an active value; moving back past
-- completed (closed-session) history needs p_input.confirm_rewind = true; closed sessions are
-- never touched (the pending session is re-pointed, history keeps its own value_id); a
-- 'table.value_changed' audit event records the move. api.table_create already takes start_value_id (FK-checked).

create or replace function api.table_update(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_before public.round_tables;
  v_after public.round_tables;
  v_pending public.sessions;
  v_value_set boolean := p_input ? 'current_value_id';
  v_new_value uuid := (p_input->>'current_value_id')::uuid;
  v_from_seq smallint;
  v_to_seq smallint;
  v_rewind boolean := false;
  v_confirmed boolean := coalesce((p_input->>'confirm_rewind')::boolean, false);
begin
  select * into v_before from public.round_tables
  where id = (p_input->>'round_table_id')::uuid for update;
  if not found then
    perform app.fail('not_found', 'La mesa no existe.');
  end if;
  perform app.require_manages_org(p_uid, v_before.organization_id);

  -- Program position (RF-28).
  if v_value_set and v_new_value is distinct from v_before.current_value_id then
    select sequence into v_to_seq from public.curriculum_values
    where id = v_new_value and status = 'active';
    if v_to_seq is null then
      perform app.fail('validation_failed', 'Elige un valor del programa (1 a 48).');
    end if;
    select sequence into v_from_seq from public.curriculum_values where id = v_before.current_value_id;
    -- A finished program (no current value) counts as past the last value.
    if coalesce(v_from_seq, 32767) > v_to_seq then
      -- Rewinding re-opens values that already have a closed session on this table.
      v_rewind := exists (
        select 1 from public.sessions s
        join public.curriculum_values cv on cv.id = s.value_id
        where s.round_table_id = v_before.id and s.status = 'closed' and cv.sequence >= v_to_seq);
      if v_rewind and not v_confirmed then
        perform app.fail('value_rewind_confirmation_required',
          'Esta mesa ya completó sesiones de ese valor o de los siguientes. Confirma para retroceder; el historial cerrado no se modifica.');
      end if;
    end if;
  end if;

  update public.round_tables set
    name = coalesce(nullif(btrim(p_input->>'name'), ''), name),
    code = coalesce(p_input->>'code', code),
    location_id = coalesce((p_input->>'location_id')::uuid, location_id),
    weekday = coalesce((p_input->>'weekday')::smallint, weekday),
    start_time = coalesce((p_input->>'start_time')::time, start_time),
    timezone = coalesce(p_input->>'timezone', timezone),
    duration_minutes = coalesce((p_input->>'duration_minutes')::smallint, duration_minutes),
    status = coalesce((p_input->>'status')::public.round_table_status,
                      -- Moving a finished table back into the program reactivates it.
                      case when v_before.status = 'completed' and v_new_value is not null
                                and v_new_value is distinct from v_before.current_value_id
                           then 'active'::public.round_table_status end,
                      status),
    current_value_id = case when v_value_set then v_new_value else current_value_id end
  where id = v_before.id
  returning * into v_after;

  select * into v_pending from public.sessions
  where round_table_id = v_after.id and status in ('scheduled', 'open') for update;

  -- Program position changed (RF-28): the pending, untouched session follows it.
  if v_after.current_value_id is distinct from v_before.current_value_id and v_pending.id is not null then
    if v_pending.status = 'open' or exists (
         select 1 from public.member_assessments where session_id = v_pending.id
         union all select 1 from public.member_answers where session_id = v_pending.id
         union all select 1 from public.member_commitments where session_id = v_pending.id) then
      perform app.fail('value_change_blocked',
        'La sesión pendiente ya tiene respuestas; ciérrala antes de cambiar el valor.');
    end if;
    if v_after.current_value_id is null then
      perform app.fail('validation_failed', 'Elige el valor en el que va la mesa.');
    end if;
    update public.sessions set value_id = v_after.current_value_id,
      follow_up_value_id = nullif(follow_up_value_id, v_after.current_value_id)
    where id = v_pending.id;
  end if;

  -- Schedule changed (RF-23): the pending, not yet opened session moves to the new slot.
  if (v_after.weekday, v_after.start_time, v_after.timezone)
       is distinct from (v_before.weekday, v_before.start_time, v_before.timezone)
     and v_pending.status = 'scheduled' then
    update public.sessions set scheduled_at = app.next_slot(v_after.id, v_after.weekday,
      v_after.start_time, v_after.timezone, now())
    where id = v_pending.id;
  end if;

  -- Pausing/closing cancels the pending scheduled session; reactivating schedules one.
  if v_after.status <> v_before.status then
    if v_after.status <> 'active' and v_pending.status = 'scheduled' then
      update public.sessions set status = 'cancelled', cancelled_reason = 'table_' || v_after.status
      where id = v_pending.id;
    elsif v_after.status = 'active' then
      perform app.schedule_next_session(v_after.id, now());
    end if;
  end if;

  perform app.audit(p_uid, app.actor_person(p_uid, v_after.organization_id), v_after.organization_id,
    'table.updated', 'round_table', v_after.id, p_input - 'round_table_id' - 'confirm_rewind');
  if v_after.current_value_id is distinct from v_before.current_value_id then
    perform app.audit(p_uid, app.actor_person(p_uid, v_after.organization_id), v_after.organization_id,
      'table.value_changed', 'round_table', v_after.id, jsonb_build_object(
        'from_value_id', v_before.current_value_id, 'to_value_id', v_after.current_value_id,
        'from_sequence', v_from_seq, 'to_sequence', v_to_seq,
        'rewind', v_rewind, 'confirmed', v_rewind and v_confirmed));
  end if;
  perform kpi.mark_dirty();
  return app.table_json(v_after.id);
end;
$$;
