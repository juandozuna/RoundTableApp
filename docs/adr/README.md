# Architecture Decision Records

Decisions for Gold Roundtables, agreed in the stack-evaluation interview on 2026-10-25.
Source requirements: the RoundTables Obsidian vault (notes 00–07).

| ADR | Decision | Status |
|---|---|---|
| [0001](0001-single-flutter-client.md) | One Flutter app for Android, iOS and web | Accepted |
| [0002](0002-supabase-backend.md) | Supabase (Postgres, RLS, Auth, Edge Functions) as backend | Accepted |
| [0003](0003-offline-scope.md) | Offline-first only for the session domain | Accepted |
| [0004](0004-powersync-drift-sync.md) | PowerSync + Drift for local persistence and sync | Accepted |
| [0005](0005-sync-conflict-rules.md) | Late sync, attendance and offline-window rules | Accepted |
| [0006](0006-multitenancy-and-roles.md) | Shared-schema multi-tenancy, roles per scope | Accepted |
| [0007](0007-identity-and-invites.md) | Social login only, phone stored unverified, invite binding | Accepted |
| [0008](0008-remote-access-split.md) | supabase_flutter for Auth, Retrofit for Edge Functions and PostgREST | Accepted |
| [0009](0009-push-notifications-fcm.md) | Firebase Cloud Messaging for four notification types | Accepted |
| [0010](0010-kpis-sql-rollups.md) | KPIs from Postgres rollups, rendered in-app | Accepted |
| [0011](0011-i18n-timezones-region.md) | Spanish first, i18n-ready, UTC + table timezone | Accepted |
| [0012](0012-client-architecture.md) | Feature-first layered client architecture (see AGENTS.md) | Accepted |
| [0013](0013-session-flow-design-direction.md) | Session flow design direction: "Mesa en vivo" | Accepted |
| [0014](0014-facilitator-is-participant.md) | The facilitator is also a participant (counts toward 9) | Accepted |

Constraints that shaped every decision: one part-time developer, NGO budget under ~US$100/month,
multiple countries from the pilot, thousands of users across 6+ organizations.
