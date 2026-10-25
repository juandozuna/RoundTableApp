# 0008 — supabase_flutter for Auth, Retrofit for Edge Functions and PostgREST

## Decision
| Concern | Path |
|---|---|
| Sign-in (Google, Apple, Facebook), sign-out, token refresh | `supabase_flutter` Auth, hidden behind an `AuthService` domain contract |
| Offline session reads | PowerSync → Drift watch streams (no app HTTP) |
| Offline session uploads | PowerSync `uploadData` → service impl → remote data source → Retrofit → `sync-upload` Edge Function |
| Admin writes (organizations, coordinators, invites, roles) | Retrofit → Edge Functions |
| Online reads (admin lists, KPI rollups) | Retrofit → PostgREST tables, views and RPC functions under RLS |

A Dio interceptor adds `apikey` and `Authorization: Bearer <jwt>`, and on a 401 refreshes through
`AuthService` and retries once.

## Rationale
- Edge Functions own writes that need elevated permissions, run across several tables in one
  transaction, record audit events or call third parties (email/SMS).
- PostgREST plus RLS serves reads without writing an endpoint per screen.
- Retrofit keeps the HTTP rule of the client architecture (AGENTS.md rule 9).
