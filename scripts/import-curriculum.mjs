#!/usr/bin/env node
// Imports the curriculum (5 modules, 48 values, reflection questions) into Postgres, idempotently.
//
//   node scripts/import-curriculum.mjs <file.json> [--dry-run] [--print-sql]
//
// Validates the whole file first and refuses partial files (exit 1, nothing written). Applies one
// transaction through $DATABASE_URL with psql, or — when unset — through the local Supabase
// database container (supabase_db_<SUPABASE_PROJECT_ID>). Format: docs/implementation/curriculum-import.md.
// Requires Node >= 18; no dependencies.

import { readFileSync } from 'node:fs';
import { spawnSync } from 'node:child_process';
import { buildImportSql, validateCurriculum } from './lib/curriculum.mjs';

const args = process.argv.slice(2);
const flags = new Set(args.filter((a) => a.startsWith('--')));
const file = args.find((a) => !a.startsWith('--'));
if (!file) {
  console.error('Usage: node scripts/import-curriculum.mjs <file.json> [--dry-run] [--print-sql]');
  process.exit(2);
}

let data;
try {
  data = JSON.parse(readFileSync(file, 'utf8'));
} catch (error) {
  console.error(`Cannot read ${file}: ${error.message}`);
  process.exit(1);
}

const errors = validateCurriculum(data);
if (errors.length > 0) {
  console.error(`${file} is not importable; nothing was written:`);
  for (const error of errors) console.error(`  - ${error}`);
  process.exit(1);
}

const valueCount = data.modules.reduce((sum, m) => sum + m.values.length, 0);
const questionCount = data.modules.reduce((sum, m) => sum + m.values.reduce((s, v) => s + v.questions.length, 0), 0);
console.log(`${file}: ${data.modules.length} modules, ${valueCount} values, ${questionCount} questions — valid.`);

const sql = buildImportSql(data);
if (flags.has('--print-sql')) process.stdout.write(sql);
if (flags.has('--dry-run')) process.exit(0);

const databaseUrl = process.env.DATABASE_URL;
const container = `supabase_db_${process.env.SUPABASE_PROJECT_ID ?? 'gold-roundtables'}`;
const [command, commandArgs] = databaseUrl
  ? ['psql', [databaseUrl, '-v', 'ON_ERROR_STOP=1', '-q']]
  : ['docker', ['exec', '-i', container, 'psql', '-U', 'postgres', '-d', 'postgres', '-v', 'ON_ERROR_STOP=1', '-q']];
const result = spawnSync(command, commandArgs, { input: sql, stdio: ['pipe', 'inherit', 'inherit'] });
if (result.error || result.status !== 0) {
  console.error(`Import failed${result.error ? `: ${result.error.message}` : ''}; the transaction was rolled back.`);
  process.exit(1);
}
console.log('Curriculum imported. Re-running the same file is safe; devices receive it through the curriculum sync stream.');
