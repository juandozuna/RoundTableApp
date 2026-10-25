-- Gold Roundtables — tenant, identity, curriculum and administration tables.
--
-- Conventions
--   * Every id is a uuid with a server default; clients may generate it (PowerSync syncs it as text).
--   * Tenant tables carry organization_id. Child rows reference parents through composite
--     foreign keys (id, organization_id) so a row can never point into another organization.
--   * Nothing is hard-deleted: status columns (and left_at / revoked_at) preserve history.

-- ---------------------------------------------------------------------------------------------
-- Organizations (tenants)
-- ---------------------------------------------------------------------------------------------
create table public.organizations (
  id uuid primary key default gen_random_uuid(),
  name text not null check (length(btrim(name)) between 2 and 120),
  kind text not null default 'other'
    check (kind in ('foundation', 'school', 'company', 'church', 'community', 'other')),
  country_code char(2) not null check (country_code ~ '^[A-Z]{2}$'),
  country_name text not null,
  region text,
  contact_name text,
  contact_email text,
  contact_phone text check (contact_phone is null or contact_phone ~ '^\+[1-9][0-9]{6,14}$'),
  status public.organization_status not null default 'active',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create unique index organizations_name_key on public.organizations (lower(name));
comment on table public.organizations is 'Tenant. Organizations never see each other''s data.';

-- ---------------------------------------------------------------------------------------------
-- People: pre-registered persons, scoped to one organization.
-- A signed-in user (auth.users) may be bound to one person per organization, so one human can
-- be "Coordinador · Fundación Luz" and "Miembro · Mesa X · Colegio Horizonte" at the same time.
-- Platform staff (church administrators) have organization_id NULL.
-- ---------------------------------------------------------------------------------------------
create table public.people (
  id uuid primary key default gen_random_uuid(),
  organization_id uuid references public.organizations (id),
  auth_user_id uuid references auth.users (id) on delete set null,
  first_name text not null check (length(btrim(first_name)) between 1 and 80),
  last_name text not null check (length(btrim(last_name)) between 1 and 80),
  position text check (position is null or length(position) <= 120),
  email text check (email is null or email ~* '^[^@\s]+@[^@\s]+\.[^@\s]+$'),
  -- International contact number, E.164, unverified (ADR 0007). Never used for sign-in.
  phone text check (phone is null or phone ~ '^\+[1-9][0-9]{6,14}$'),
  status public.person_status not null default 'invited',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (id, organization_id)
);
create unique index people_auth_user_per_org_key on public.people
  (coalesce(organization_id, '00000000-0000-0000-0000-000000000000'::uuid), auth_user_id)
  where auth_user_id is not null;
create index people_auth_user_idx on public.people (auth_user_id);
create index people_org_idx on public.people (organization_id);

-- ---------------------------------------------------------------------------------------------
-- Role assignments: platform_admin (global, organization_id NULL) and coordinator (one org).
-- Facilitator and member are not stored here: they derive from table_members.
-- location_id is informational in v1 (coordinators are organization-wide; ADR 0006).
-- ---------------------------------------------------------------------------------------------
create table public.locations (
  id uuid primary key default gen_random_uuid(),
  organization_id uuid not null references public.organizations (id),
  name text not null check (length(btrim(name)) between 2 and 120),
  city text,
  region text,
  address text,
  status public.record_status not null default 'active',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (id, organization_id)
);
create unique index locations_org_name_key on public.locations (organization_id, lower(name));

create table public.role_assignments (
  id uuid primary key default gen_random_uuid(),
  person_id uuid not null references public.people (id),
  role public.role_kind not null,
  organization_id uuid references public.organizations (id),
  location_id uuid references public.locations (id),
  status public.record_status not null default 'active',
  granted_by_person_id uuid references public.people (id),
  revoked_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint role_assignments_scope_check check (
    (role = 'platform_admin' and organization_id is null and location_id is null)
    or (role = 'coordinator' and organization_id is not null)
  ),
  -- A coordinator's person must belong to the coordinated organization.
  constraint role_assignments_person_org_fkey foreign key (person_id, organization_id)
    references public.people (id, organization_id)
);
create unique index role_assignments_active_key on public.role_assignments
  (person_id, role, coalesce(organization_id, '00000000-0000-0000-0000-000000000000'::uuid))
  where status = 'active';

-- ---------------------------------------------------------------------------------------------
-- Curriculum (global reference data): 5 modules, 48 values, reflection questions.
-- ---------------------------------------------------------------------------------------------
create table public.curriculum_modules (
  id uuid primary key default gen_random_uuid(),
  number smallint not null unique check (number between 1 and 20),
  name text not null,
  description text,
  value_count smallint not null check (value_count > 0),
  status public.record_status not null default 'active',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.curriculum_values (
  id uuid primary key default gen_random_uuid(),
  module_id uuid not null references public.curriculum_modules (id),
  number_in_module smallint not null check (number_in_module > 0),
  -- Global program order 1..48; the next session works the next sequence value.
  sequence smallint not null unique check (sequence > 0),
  name text not null,
  description text,
  booklet_reference text,
  status public.record_status not null default 'active',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (module_id, number_in_module)
);

create table public.value_questions (
  id uuid primary key default gen_random_uuid(),
  value_id uuid not null references public.curriculum_values (id),
  question_code text not null,
  question_text text not null,
  sort_order smallint not null default 1,
  response_type text not null default 'text' check (response_type in ('text', 'person')),
  status public.record_status not null default 'active',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (value_id, question_code)
);

-- ---------------------------------------------------------------------------------------------
-- Round tables
-- ---------------------------------------------------------------------------------------------
create table public.round_tables (
  id uuid primary key default gen_random_uuid(),
  organization_id uuid not null references public.organizations (id),
  location_id uuid not null,
  name text not null check (length(btrim(name)) between 2 and 120),
  code text not null check (code ~ '^[A-Z0-9][A-Z0-9-]{1,19}$'),
  -- Local schedule in the table's IANA timezone (ADR 0011). weekday is ISO: 1 = Monday.
  weekday smallint not null check (weekday between 1 and 7),
  start_time time not null,
  timezone text not null,
  duration_minutes smallint not null default 30 check (duration_minutes between 10 and 120),
  status public.round_table_status not null default 'active',
  -- The value the next (or currently pending) session works. NULL once the program is finished.
  current_value_id uuid references public.curriculum_values (id),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (id, organization_id),
  constraint round_tables_location_org_fkey foreign key (location_id, organization_id)
    references public.locations (id, organization_id)
);
create unique index round_tables_org_code_key on public.round_tables (organization_id, code);
create index round_tables_location_idx on public.round_tables (location_id);

-- ---------------------------------------------------------------------------------------------
-- Table members: the facilitator and the members of a table (ADR 0014: the facilitator is also
-- a participant, so the facilitator row counts toward the 9-person limit).
-- History is preserved: leaving/moving sets status = inactive and left_at.
-- first_name/last_name/auth_user_id are denormalized from people by trigger so PowerSync can
-- bucket and render the roster without joins (sync rules cannot join).
-- ---------------------------------------------------------------------------------------------
create table public.table_members (
  id uuid primary key default gen_random_uuid(),
  organization_id uuid not null references public.organizations (id),
  round_table_id uuid not null,
  person_id uuid not null,
  role public.table_member_role not null default 'member',
  joined_at timestamptz not null default now(),
  left_at timestamptz,
  left_reason text check (left_reason is null
    or left_reason in ('moved', 'deactivated', 'facilitator_changed', 'invite_revoked')),
  moved_to_round_table_id uuid references public.round_tables (id),
  status public.record_status not null default 'active',
  first_name text not null default '',
  last_name text not null default '',
  auth_user_id uuid,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint table_members_table_org_fkey foreign key (round_table_id, organization_id)
    references public.round_tables (id, organization_id),
  constraint table_members_person_org_fkey foreign key (person_id, organization_id)
    references public.people (id, organization_id),
  constraint table_members_left_check check ((status = 'inactive') = (left_at is not null)),
  constraint table_members_dates_check check (left_at is null or left_at >= joined_at)
);
-- One active membership per person per table.
create unique index table_members_active_person_key on public.table_members
  (round_table_id, person_id) where status = 'active';
-- At most one active facilitator per table.
create unique index table_members_active_facilitator_key on public.table_members
  (round_table_id) where status = 'active' and role = 'facilitator';
create index table_members_person_idx on public.table_members (person_id);
create index table_members_auth_user_idx on public.table_members (auth_user_id)
  where status = 'active';

-- ---------------------------------------------------------------------------------------------
-- Invites: pre-registration produces a 6-character code (link + code + QR) that binds a social
-- sign-in to the pre-created person (ADR 0007). Codes avoid ambiguous characters (0/O, 1/I).
-- ---------------------------------------------------------------------------------------------
create table public.invites (
  id uuid primary key default gen_random_uuid(),
  organization_id uuid not null references public.organizations (id),
  person_id uuid not null,
  code char(6) not null unique check (code ~ '^[A-HJ-NP-Z2-9]{6}$'),
  role_kind public.invite_role_kind not null,
  round_table_id uuid,
  invited_by_person_id uuid references public.people (id),
  status public.invite_status not null default 'pending',
  expires_at timestamptz not null default now() + interval '14 days',
  accepted_at timestamptz,
  accepted_auth_user_id uuid references auth.users (id) on delete set null,
  revoked_at timestamptz,
  revoked_by_person_id uuid references public.people (id),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint invites_person_org_fkey foreign key (person_id, organization_id)
    references public.people (id, organization_id),
  constraint invites_table_org_fkey foreign key (round_table_id, organization_id)
    references public.round_tables (id, organization_id),
  constraint invites_scope_check check (
    (role_kind = 'coordinator' and round_table_id is null)
    or (role_kind in ('facilitator', 'member') and round_table_id is not null)
  )
);
create index invites_org_status_idx on public.invites (organization_id, status);
create index invites_table_idx on public.invites (round_table_id);
create index invites_person_idx on public.invites (person_id);

-- ---------------------------------------------------------------------------------------------
-- Audit trail (RF-08, RF-71). Append-only: no role has UPDATE/DELETE privileges.
-- organization_id is NULL for platform-level events (e.g. creating an organization is logged
-- with the new organization's id; granting platform_admin is logged with NULL).
-- ---------------------------------------------------------------------------------------------
create table public.audit_events (
  id uuid primary key default gen_random_uuid(),
  organization_id uuid references public.organizations (id),
  actor_auth_user_id uuid,
  actor_person_id uuid references public.people (id),
  event_type text not null,
  entity_type text not null,
  entity_id uuid,
  payload jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);
create index audit_events_org_created_idx on public.audit_events (organization_id, created_at desc);
create index audit_events_entity_idx on public.audit_events (entity_type, entity_id);

-- ---------------------------------------------------------------------------------------------
-- Device tokens for FCM (ADR 0009). Per signed-in user and device; removed on sign-out.
-- Not tenant-scoped: a user's devices serve all of their contexts.
-- ---------------------------------------------------------------------------------------------
create table public.device_tokens (
  id uuid primary key default gen_random_uuid(),
  auth_user_id uuid not null references auth.users (id) on delete cascade,
  token text not null unique check (length(token) between 10 and 4096),
  platform public.device_platform not null,
  last_seen_at timestamptz not null default now(),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index device_tokens_user_idx on public.device_tokens (auth_user_id);

-- updated_at triggers
create trigger organizations_touch before update on public.organizations
  for each row execute function app.touch_updated_at();
create trigger people_touch before update on public.people
  for each row execute function app.touch_updated_at();
create trigger locations_touch before update on public.locations
  for each row execute function app.touch_updated_at();
create trigger role_assignments_touch before update on public.role_assignments
  for each row execute function app.touch_updated_at();
create trigger curriculum_modules_touch before update on public.curriculum_modules
  for each row execute function app.touch_updated_at();
create trigger curriculum_values_touch before update on public.curriculum_values
  for each row execute function app.touch_updated_at();
create trigger value_questions_touch before update on public.value_questions
  for each row execute function app.touch_updated_at();
create trigger round_tables_touch before update on public.round_tables
  for each row execute function app.touch_updated_at();
create trigger table_members_touch before update on public.table_members
  for each row execute function app.touch_updated_at();
create trigger invites_touch before update on public.invites
  for each row execute function app.touch_updated_at();
create trigger device_tokens_touch before update on public.device_tokens
  for each row execute function app.touch_updated_at();
