# Curriculum import (issue #4)

The 48 values and their reflection questions are global reference data. `supabase/seed.sql` carries
placeholders for development; the real content comes from the church (ADR 0016). It is loaded with
a script, never by editing migrations.

## File format

`supabase/curriculum/curriculum.example.json` is the template (it mirrors the seed placeholders).
Copy it, replace the content, keep the structure:

```json
{
  "modules": [
    {
      "number": 1,
      "name": "Carácter",
      "description": "optional",
      "values": [
        {
          "number": 1,
          "name": "Integridad",
          "description": "optional",
          "bookletReference": "optional, e.g. Cuadernillo M1 · V1",
          "questions": [
            { "code": "por_que", "text": "¿Por qué te diste ese puntaje en integridad?", "responseType": "text" }
          ]
        }
      ]
    }
  ]
}
```

Rules (the script refuses the whole file otherwise, writing nothing):

- Exactly 5 modules, numbered 1–5 in order, with 10 / 10 / 10 / 10 / 8 values.
- Values are numbered globally 1–48 in program order, no gaps (module 1 = 1–10 … module 5 = 41–48).
  The number is the value's `sequence`: the next session works the next one.
- `name` is required for modules, values and questions' `text`.
- Each value has at least one question (the seed uses 2–3). `code` is unique inside the value and
  matches `[a-z0-9_]{1,40}`; `responseType` is `text` (default) or `person`. Order in the array is
  the display order.

## Running it

```bash
node scripts/import-curriculum.mjs path/to/curriculum.json --dry-run   # validate only
node scripts/import-curriculum.mjs path/to/curriculum.json             # local Supabase container
DATABASE_URL=postgres://… node scripts/import-curriculum.mjs file.json # any database (needs psql)
```

`--print-sql` prints the generated SQL. Without `DATABASE_URL` it uses the local
`supabase_db_<SUPABASE_PROJECT_ID>` container (default `gold-roundtables`).

## Idempotency and ids

- One transaction; upserts by natural key: module `number`, value `sequence`, question
  `(value, code)`. Re-running the same file changes nothing but `updated_at` on edited rows.
- New rows get deterministic ids (`md5('gold-roundtables:<label>')`, the same scheme as the seed),
  so the seed placeholders and a later import converge on the same ids. Existing ids are never
  rewritten, so answers and sessions that reference them stay valid.
- A question dropped from the file is set `inactive`, never deleted (answers reference it); it
  reactivates if it returns. Modules and values are fixed in number, so they are never removed.
- Edited rows sync to devices through the `curriculum` PowerSync stream; no app release is needed.

## Seed

`supabase/seed.sql` keeps its own copy of the placeholder curriculum (it needs the session-local
`pg_temp.uid` helper and runs inside `supabase db reset`, which cannot read the JSON). A unit test
asserts the example file has the same value names as the seed, and both generate the same ids. For
a local database with real content: `bash scripts/dev-reset.sh`, then run the import.

## Tests

`node --test scripts/test/*.test.mjs` covers validation (counts, gaps, duplicates, partial files),
quoting and deterministic SQL.
