-- Invites (ADR 0007), administration (online-only) and logged answer reveal (ADR 0015).
begin;
create extension if not exists pgtap with schema extensions;
select plan(44);

create function pg_temp.u(p text) returns uuid language sql immutable as
  $$ select md5('gold-roundtables:user:' || p)::uuid $$;
create function pg_temp.id(p text) returns uuid language sql immutable as
  $$ select md5('gold-roundtables:' || p)::uuid $$;
-- Returns the error code raised by a statement (NULL when it succeeds).
create function pg_temp.err(p_sql text) returns text language plpgsql as $$
begin
  execute p_sql;
  return null;
exception when others then
  return sqlerrm;
end;
$$;

-- A brand-new social sign-in (no person linked yet).
insert into auth.users (instance_id, id, aud, role, email, raw_app_meta_data, created_at, updated_at)
values ('00000000-0000-0000-0000-000000000000', pg_temp.id('t:new-user'), 'authenticated',
        'authenticated', 'nuevo@example.com', '{"provider":"google","providers":["google"]}', now(), now()),
       ('00000000-0000-0000-0000-000000000000', pg_temp.id('t:other-user'), 'authenticated',
        'authenticated', 'otro@example.com', '{"provider":"apple","providers":["apple"]}', now(), now());

-- ── Facilitator invites a member to their table ────────────────────────────────────────────
create temp table t_invite as
select api.invite_create(pg_temp.u('facil'), jsonb_build_object(
  'role_kind', 'member', 'round_table_id', pg_temp.id('table:luz-03'),
  'person', jsonb_build_object('first_name', 'Valentina', 'last_name', 'Cruz',
                               'email', 'valentina@example.com', 'phone', '+18095550099'))) as j;
select matches((select j->>'code' from t_invite), '^[A-HJ-NP-Z2-9]{6}$', 'invite code is 6 unambiguous characters');
select is((select j->>'status' from t_invite), 'pending', 'new invite is pending');
select is((select count(*)::int from public.table_members
           where round_table_id = pg_temp.id('table:luz-03') and status = 'active'), 9,
          'the invite reserves a seat (Mesa Esperanza 03 is now 9/9)');
select is(pg_temp.err($$select api.invite_create(md5('gold-roundtables:user:facil')::uuid,
            '{"role_kind":"member","round_table_id":"$$ || md5('gold-roundtables:table:luz-03')::uuid ||
            $$","person":{"first_name":"Uno","last_name":"Más"}}')$$),
          'table_full', 'inviting a 10th person is rejected');
select is(pg_temp.err($$select api.invite_create(md5('gold-roundtables:user:facil')::uuid,
            '{"role_kind":"coordinator","organization_id":"$$ || md5('gold-roundtables:org:luz')::uuid ||
            $$","person":{"first_name":"A","last_name":"B"}}')$$),
          'invite_role_forbidden', 'a facilitator cannot invite coordinators');
select is(pg_temp.err($$select api.invite_create(md5('gold-roundtables:user:coord-horizonte')::uuid,
            '{"role_kind":"member","round_table_id":"$$ || md5('gold-roundtables:table:luz-01')::uuid ||
            $$","person":{"first_name":"A","last_name":"B"}}')$$),
          'forbidden', 'a coordinator of another organization cannot invite into this one');

-- ── Role matrix (ADR 0016) ─────────────────────────────────────────────────────────────────
select is(api.invite_create(pg_temp.u('admin'), jsonb_build_object(
            'role_kind', 'coordinator', 'organization_id', pg_temp.id('org:luz'),
            'person', jsonb_build_object('first_name', 'Nora', 'last_name', 'Admin',
                                         'email', 'nora@example.com')))->>'role_kind',
          'coordinator', 'the platform admin invites a coordinator');
select is(pg_temp.err($$select api.invite_create(md5('gold-roundtables:user:coord')::uuid,
            '{"role_kind":"coordinator","organization_id":"$$ || md5('gold-roundtables:org:luz')::uuid ||
            $$","person":{"first_name":"A","last_name":"B"}}')$$),
          'invite_role_forbidden', 'a coordinator cannot invite coordinators');
select is(api.invite_create(pg_temp.u('coord'), jsonb_build_object(
            'role_kind', 'member', 'round_table_id', pg_temp.id('table:luz-04'),
            'person', jsonb_build_object('first_name', 'Cora', 'last_name', 'Coord',
                                         'email', 'cora@example.com')))->>'role_kind',
          'member', 'a coordinator adds a member to any table of the organization');
select is(pg_temp.err($$select api.invite_create(md5('gold-roundtables:user:facil')::uuid,
            '{"role_kind":"member","round_table_id":"$$ || md5('gold-roundtables:table:luz-01')::uuid ||
            $$","person":{"first_name":"A","last_name":"B"}}')$$),
          'invite_table_forbidden', 'a facilitator cannot invite into a table that is not theirs');
select is(pg_temp.err($$select api.invite_create(md5('gold-roundtables:user:facil')::uuid,
            '{"role_kind":"facilitator","round_table_id":"$$ || md5('gold-roundtables:table:luz-03')::uuid ||
            $$","person":{"first_name":"A","last_name":"B"}}')$$),
          'invite_role_forbidden', 'a facilitator cannot invite facilitators');
select is(pg_temp.err($$select api.invite_create(md5('gold-roundtables:user:ana')::uuid,
            '{"role_kind":"member","round_table_id":"$$ || md5('gold-roundtables:table:luz-03')::uuid ||
            $$","person":{"first_name":"A","last_name":"B"}}')$$),
          'forbidden', 'a member cannot invite');
select is(pg_temp.err(format($$select api.invite_revoke(%L, %L)$$, pg_temp.u('coord'),
            jsonb_build_object('invite_id', (select id from public.invites where code = 'CRDN26')))),
          'invite_role_forbidden', 'a coordinator cannot manage a coordinator invite');
select is(api.invite_revoke(pg_temp.u('admin'),
            jsonb_build_object('invite_id', (select id from public.invites where code = 'CRDN26')))->>'status',
          'revoked', 'the platform admin revokes a coordinator invite');
select is(pg_temp.err(format($$select api.role_grant(%L, %L)$$, pg_temp.u('coord'), jsonb_build_object(
            'person_id', pg_temp.id('person:ana'), 'role', 'coordinator'))),
          'invite_role_forbidden', 'a coordinator cannot grant the coordinator role directly');

-- ── Preview (anonymous) ────────────────────────────────────────────────────────────────────
create temp table t_preview as select api.invite_preview(lower((select j->>'code' from t_invite))) as j;
select is((select j->>'organization_name' from t_preview), 'Fundación Luz', 'preview shows the organization (code is case-insensitive)');
select is((select j->>'round_table_name' from t_preview), 'Mesa Esperanza 03', 'preview shows the table');
select ok(not ((select j from t_preview) ? 'email') and not ((select j from t_preview) ? 'phone'),
          'preview exposes no contact data');
select is(pg_temp.err($$select api.invite_preview('VENC22')$$), 'invite_expired', 'expired invite');
select is(pg_temp.err($$select api.invite_preview('REVK23')$$), 'invite_revoked', 'revoked invite');
select is(pg_temp.err($$select api.invite_preview('ACEP24')$$), 'invite_already_used', 'used invite');
select is(pg_temp.err($$select api.invite_preview('ZZZZZZ')$$), 'invite_not_found', 'unknown code');

-- ── Redeem ─────────────────────────────────────────────────────────────────────────────────
create temp table t_redeem as
select api.invite_redeem(pg_temp.id('t:new-user'), 'nuevo@example.com',
  jsonb_build_object('code', (select j->>'code' from t_invite),
                     'profile', jsonb_build_object('phone', '+18095550100'))) as j;
select is((select (j->'person'->>'linked')::boolean from t_redeem), true, 'redeem binds the identity to the person');
select is((select j->'contexts'->0->>'label' from t_redeem), 'Miembro · Mesa Esperanza 03', 'redeem returns the new context');
select is((select phone from public.people where auth_user_id = pg_temp.id('t:new-user')), '+18095550100',
          'profile edits are applied on redeem');
select is((select auth_user_id from public.table_members
           where person_id = (select (j->'person'->>'id')::uuid from t_redeem)), pg_temp.id('t:new-user'),
          'roster copy carries the bound auth user (denormalized for RLS and client reads)');
select is((api.invite_redeem(pg_temp.id('t:new-user'), null,
           jsonb_build_object('code', (select j->>'code' from t_invite))))->>'already_redeemed', 'true',
          're-redeeming with the same account is idempotent');
select is(pg_temp.err(format($$select api.invite_redeem(%L, null, %L)$$, pg_temp.id('t:other-user'),
            jsonb_build_object('code', (select j->>'code' from t_invite)))),
          'invite_already_used', 'another account cannot reuse the invite');
select is(pg_temp.err(format($$select api.invite_redeem(%L, null, '{"code":"FACL27"}')$$, pg_temp.u('ana'))),
          'identity_linked_elsewhere', 'an account already linked in the organization cannot take a second person there');
select is(pg_temp.err(format($$select api.invite_redeem(%L, null, '{"code":"VENC22"}')$$, pg_temp.id('t:other-user'))),
          'invite_expired', 'expired invites cannot be redeemed');

-- ── Revoke frees the seat ──────────────────────────────────────────────────────────────────
select is((api.invite_revoke(pg_temp.u('facil'), jsonb_build_object('invite_id', pg_temp.id('invite:rodrigo'))))->>'status',
          'revoked', 'facilitator revokes a pending invite');
select is((select count(*)::int from public.table_members
           where round_table_id = pg_temp.id('table:luz-03') and status = 'active'), 8,
          'revoking frees the reserved seat');

-- ── Administration ─────────────────────────────────────────────────────────────────────────
select is(pg_temp.err(format($$select api.table_create(%L, %L)$$, pg_temp.u('coord'), jsonb_build_object(
            'organization_id', pg_temp.id('org:luz'), 'location_id', pg_temp.id('loc:luz-central'),
            'name', 'Mesa Sin Facilitador', 'code', 'LUZ-90', 'weekday', 2, 'start_time', '19:00',
            'timezone', 'America/Santo_Domingo'))),
          'facilitator_required', 'a table needs a facilitator');
create temp table t_table as
select api.table_create(pg_temp.u('coord'), jsonb_build_object(
  'organization_id', pg_temp.id('org:luz'), 'location_id', pg_temp.id('loc:luz-central'),
  'name', 'Mesa Prueba 91', 'code', 'luz-91', 'weekday', 2, 'start_time', '19:00',
  'timezone', 'America/Santo_Domingo',
  'facilitator', jsonb_build_object('person', jsonb_build_object('first_name', 'Rita', 'last_name', 'Gil')))) as j;
select is((select j->>'code' from t_table), 'LUZ-91', 'table code is normalized to uppercase');
select is((select j->'facilitator_invite'->>'role_kind' from t_table), 'facilitator',
          'a new facilitator gets a facilitator invite');
select is((select j->'pending_session'->>'status' from t_table), 'scheduled', 'the first session is scheduled');
select is(pg_temp.err(format($$select api.table_create(%L, %L)$$, pg_temp.u('coord'), jsonb_build_object(
            'organization_id', pg_temp.id('org:luz'), 'location_id', pg_temp.id('loc:luz-central'),
            'name', 'Otra', 'code', 'LUZ-91', 'weekday', 2, 'start_time', '19:00',
            'timezone', 'America/Santo_Domingo',
            'facilitator', jsonb_build_object('person_id', pg_temp.id('person:coord'))))),
          'duplicate key value violates unique constraint "round_tables_org_code_key"',
          'duplicate table codes are rejected');
select is(pg_temp.err(format($$select api.member_move(%L, %L)$$, pg_temp.u('coord'), jsonb_build_object(
            'table_member_id', pg_temp.id('tm:luz-01:' || pg_temp.id('person:luz-01:2')),
            'to_round_table_id', pg_temp.id('table:luz-05')))),
          'table_full', 'moving into a full table is rejected');
select is(pg_temp.err(format($$select api.organization_create(%L, '{"name":"X","country_code":"GT","country_name":"Guatemala"}')$$,
            pg_temp.u('coord'))),
          'forbidden', 'only platform admins create organizations');

-- ── Answers reveal ─────────────────────────────────────────────────────────────────────────
select ok(jsonb_array_length((api.answers_reveal(pg_temp.u('coord'),
            jsonb_build_object('round_table_id', pg_temp.id('table:luz-03'))))->'people') >= 5,
          'coordinator reveals the table''s individual answers');
select ok(exists (select 1 from public.audit_events where event_type = 'answers.revealed'
                  and actor_auth_user_id = pg_temp.u('coord')),
          'the reveal is written to the audit log');
select is(pg_temp.err(format($$select api.answers_reveal(%L, %L)$$, pg_temp.u('coord-horizonte'),
            jsonb_build_object('round_table_id', pg_temp.id('table:luz-03')))),
          'forbidden', 'answers of another organization cannot be revealed');

select is(pg_temp.err(format($$select api.sync_apply(%L, %L)$$, pg_temp.u('marta'), jsonb_build_array(jsonb_build_object(
            'op', 'PUT', 'table', 'member_answers', 'id', gen_random_uuid(), 'data', jsonb_build_object(
              'session_id', pg_temp.id('session:luz-03:3'), 'person_id', pg_temp.id('person:marta'),
              'question_id', pg_temp.id('question:3:por_que'), 'answer_text', 'Una semana después'))))),
          null, 'sync_apply never raises for a rejected op...');
select is((api.sync_apply(pg_temp.u('marta'), jsonb_build_array(jsonb_build_object(
            'op', 'PUT', 'table', 'member_answers', 'id', gen_random_uuid(), 'data', jsonb_build_object(
              'session_id', pg_temp.id('session:luz-03:3'), 'person_id', pg_temp.id('person:marta'),
              'question_id', pg_temp.id('question:3:por_que'), 'answer_text', 'Una semana después')))))->'results'->0->>'code',
          'session_closed', '...answers captured after the close (beyond grace) are rejected');

select * from finish();
rollback;
