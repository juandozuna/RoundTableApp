# Curriculum import and administration (issue #4, ADR 0017)

Two ways to load the same curriculum: the **admin backoffice** ("Currículo", for platform administrators;
section below) and the **command-line script** (this section onwards). Both use the same file format
and the same validation, and converge on the same ids.

The 48 values and their reflection questions are global reference data. `supabase/seed.sql` carries
placeholders for development; the real content comes from the church (ADR 0016). It is loaded with
a script, never by editing migrations.

## Admin backoffice ("Currículo", ADR 0017)

Platform administrators only; online only. Navigation → **Currículo**.

- **View**: modules → values → questions, in Spanish or in any content language (chips on top).
  Questions that are switched off show struck through; a question with answers says "con respuestas".
- **Upload** (Subir currículo): choose a `.json` or `.csv` file or paste its contents, press
  **Revisar cambios** and read the diff (new / changed / reactivated / deactivated, before → after per
  field, refusals in red); nothing is saved until **Aplicar cambios**. Uploading the same file again
  shows "No hay cambios". The upload is one database transaction: it applies completely or not at all.
- **Edit** (pencil icons): module, value and question text; booklet reference; a question's answer
  type and whether it is active; add a question to a value. Every edit is audited.
- **Languages**: *Agregar idioma* (code of 2–3 lowercase letters, e.g. `en`, plus a name). Each language
  shows how many of the Spanish texts are translated. *Subir traducción* takes a file in the same shape
  as the curriculum file, but partial and with only the keys and the translated text; pencil icons edit
  one text; *Compartir archivo del currículo* exports the current language as a starting file for
  translators. Untranslated text is shown in Spanish to users. A language can be hidden from the app.
- **What is protected**: questions are never deleted (deactivated instead); text edits are always
  allowed; the answer type of a question that has answers cannot change, a value used by sessions
  cannot move, and every value keeps at least one active question. A file that would break one of
  these is shown as "No se puede aplicar este archivo" and applies nothing.

### Translation file

```json
{
  "locale": "en",
  "modules": [
    { "number": 1, "name": "Character",
      "values": [
        { "number": 1, "name": "Integrity", "description": "…",
          "questions": [ { "code": "por_que", "text": "Why did you give yourself that score?" } ] }
      ] }
  ]
}
```

Only what is present is changed (blank text clears a translation). Unknown module/value numbers or
question codes are refused. `bookletReference`, `responseType` and numbering are not translatable.

### CSV

Header `kind,module,value,code,name,description,booklet_reference,text,response_type`, comma or
semicolon separated, quoted cells allowed, one row per item:

```csv
kind,module,value,code,name,description,booklet_reference,text,response_type
module,1,,,Carácter,,,,
value,1,1,,Integridad,"Hacer lo correcto, siempre",Cuadernillo M1 · V1,,
question,,1,por_que,,,,¿Por qué te diste ese puntaje?,text
```

For a translation CSV use the same columns with the translated `name`/`description`/`text`
(value rows still need `module`; question rows need `value` and `code`).

### How devices get it

Edits and translations reach devices through the `curriculum` sync stream (no release). The app shows
text in the content language chosen in Settings ("Idioma del contenido", visible once there are two
languages), falling back to Spanish per field.

### Code map

SQL: `supabase/migrations/20261030000000_curriculum_admin.sql` (`app.curriculum_problems`,
`app.curriculum_apply`, `api.curriculum_*`). Edge: `supabase/functions/admin/curriculum.ts`,
`_shared/curriculum.ts` (port of `scripts/lib/curriculum.mjs`; `curriculum_test.ts` checks both agree).
Client: `lib/features/curriculum`, `lib/features/settings` (content language).
Tests: pgTAP `110_curriculum_admin`, deno `_shared/curriculum_test.ts`, `test/features/curriculum`,
`test/features/session/data/content_language_resolution_test.dart`, e2e `tool/e2e/scenarios/curriculum.mjs`.

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
