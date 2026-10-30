# Architecture Decision Records

Decisions for Gold Roundtables, agreed in the stack-evaluation interview on 2026-10-25.
Source requirements: the RoundTables Obsidian vault (notes 00–07).

| ADR | Decision | Status |
|---|---|---|
| [0001](0001-single-flutter-client.md) | One Flutter app for Android, iOS and web | Accepted |
| [0002](0002-supabase-backend.md) | Supabase (Postgres, RLS, Auth, Edge Functions) as backend | Accepted |
| [0003](0003-offline-scope.md) | Offline-first only for the session domain (temporarily online, see 0019) | Accepted, amended by 0019 |
| [0004](0004-powersync-drift-sync.md) | PowerSync + Drift for local persistence and sync | Superseded by 0019 |
| [0005](0005-sync-conflict-rules.md) | Late sync, attendance and offline-window rules | Accepted |
| [0006](0006-multitenancy-and-roles.md) | Shared-schema multi-tenancy, roles per scope | Accepted |
| [0007](0007-identity-and-invites.md) | Social login only, phone stored unverified, invite binding (sign-in method superseded by 0018) | Accepted, partly superseded |
| [0008](0008-remote-access-split.md) | supabase_flutter for Auth, Retrofit for Edge Functions and PostgREST | Accepted |
| [0009](0009-push-notifications-fcm.md) | Firebase Cloud Messaging for four notification types | Accepted |
| [0010](0010-kpis-sql-rollups.md) | KPIs from Postgres rollups, rendered in-app | Accepted |
| [0011](0011-i18n-timezones-region.md) | Spanish first, i18n-ready, UTC + table timezone | Accepted |
| [0012](0012-client-architecture.md) | Feature-first layered client architecture (see AGENTS.md) | Accepted |
| [0013](0013-session-flow-design-direction.md) | Session flow design direction: "Mesa en vivo" | Accepted |
| [0014](0014-facilitator-is-participant.md) | The facilitator is also a participant (counts toward 9) | Accepted |
| [0015](0015-login-and-admin-design-directions.md) | Login "Puerta única" and admin "Explorador de mesas" design directions | Accepted |
| [0016](0016-role-matrix-and-curriculum-import.md) | Role matrix (coordinator adds members) and curriculum import path | Accepted |
| [0017](0017-curriculum-admin-and-content-languages.md) | Curriculum administration in the backoffice and content languages (translations per locale, Spanish fallback) | Accepted |
| [0018](0018-email-password-sign-in.md) | Email + password sign-in in production; social login behind `AUTH_METHODS` | Accepted |
| [0019](0019-online-only-supabase-data-layer.md) | Online-only data layer on Supabase: PostgREST reads under RLS, polling, immediate `sync-upload` writes; PowerSync and Drift removed; own offline outbox later | Accepted |

Constraints that shaped every decision: one part-time developer, NGO budget under ~US$100/month,
multiple countries from the pilot, thousands of users across 6+ organizations.
