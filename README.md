# Gold Roundtables

A multi-tenant app for running weekly "mesas redondas", the values-formation program of
Iglesia Casa del Altísimo. Facilitators run sessions and members record attendance, self-scores,
reflections and commitments on their own phones, even without internet. Organizations, the church
and coordinators follow progress through KPI dashboards.

## Status
Design and architecture phase. No application code yet.

- Architecture decisions: [docs/adr](docs/adr/README.md)
- Contributor and agent rules: [AGENTS.md](AGENTS.md)
- UI prototypes (open in a browser): [docs/design/prototypes](docs/design/prototypes)

## Planned stack
Flutter (Android, iOS, web) · Supabase (Postgres + RLS, Auth, Edge Functions) · PowerSync + Drift
for offline session sync · Firebase Cloud Messaging.

## License
[MIT](LICENSE)
