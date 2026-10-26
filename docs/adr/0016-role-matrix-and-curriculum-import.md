# 0016 — Role matrix and curriculum content

## Context
The requirements audit (docs/implementation/requirements-trace.md) found that coordinators could invite
other coordinators, which goes beyond PC-03, and that the 48 values and their reflection questions
are placeholders. The product owner decided both on 2026-10-26.

## Decision
- **Who may create whom**
  - Platform administrator: creates organizations and their coordinators (and may create anyone).
  - Coordinator: creates tables and facilitators, and may add members to any table of their
    organization (useful when a facilitator is absent). A coordinator may NOT invite other
    coordinators or administrators.
  - Facilitator: adds members to their own table only.
  - Member: cannot invite.
  The rule is enforced in the database functions behind the Edge Functions, mirrored in the
  invite form (locked role options) and covered by tests.
- **Curriculum content**: the church supplies the real 48 values and reflection questions later.
  Until then the seed keeps placeholders. The project provides a documented import path (a
  JSON/CSV seed file format and an idempotent import script) so the real content can be loaded
  without code changes; the `curriculum_values` ordering (1–48) and module structure stay fixed.

## Consequences
- Backend, invite UI and admin UI must follow the matrix; the e2e invite scenario must cover the
  denied cases.
- Curriculum text is reference data, synced to every device; an update replaces rows by number.
