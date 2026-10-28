import { test } from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { buildImportSql, stableId, validateCurriculum } from '../lib/curriculum.mjs';

const example = () => JSON.parse(readFileSync(new URL('../../supabase/curriculum/curriculum.example.json', import.meta.url), 'utf8'));

test('example file is valid: 5 modules, 10/10/10/10/8 values', () => {
  const data = example();
  assert.deepEqual(validateCurriculum(data), []);
  assert.deepEqual(data.modules.map((m) => m.values.length), [10, 10, 10, 10, 8]);
});

test('refuses partial files', () => {
  const missingModule = example();
  missingModule.modules.pop();
  assert.ok(validateCurriculum(missingModule).length > 0);

  const missingValue = example();
  missingValue.modules[4].values.pop();
  assert.ok(validateCurriculum(missingValue).some((e) => e.includes('must have 8 values')));

  assert.ok(validateCurriculum({}).length > 0);
});

test('rejects gaps, empty questions, duplicate codes and bad types', () => {
  const data = example();
  data.modules[0].values[2].number = 9;
  data.modules[0].values[0].questions = [];
  data.modules[0].values[1].questions[1].code = data.modules[0].values[1].questions[0].code;
  data.modules[0].values[3].questions[0].responseType = 'number';
  data.modules[1].values[0].name = '  ';
  const errors = validateCurriculum(data).join('\n');
  assert.match(errors, /number must be 3/);
  assert.match(errors, /at least one question/);
  assert.match(errors, /duplicate code/);
  assert.match(errors, /responseType/);
  assert.match(errors, /name is required/);
});

test('ids match the seed scheme and SQL is deterministic (re-run safe)', () => {
  assert.equal(stableId('module:1'), stableId('module:1'));
  assert.match(stableId('value:48'), /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/);
  const first = buildImportSql(example());
  assert.equal(first, buildImportSql(example()));
  assert.equal((first.match(/on conflict \(number\)/g) ?? []).length, 5);
  assert.equal((first.match(/on conflict \(sequence\)/g) ?? []).length, 48);
  assert.ok(first.startsWith('begin;') && first.trimEnd().endsWith('commit;'));
});

test('escapes quotes in content', () => {
  const data = example();
  data.modules[0].values[0].name = "L'Intégrité";
  assert.match(buildImportSql(data), /'L''Intégrité'/);
});

test('example mirrors the seed placeholder names', () => {
  const seed = readFileSync(new URL('../../supabase/seed.sql', import.meta.url), 'utf8');
  const names = [...seed.matchAll(/\((\d+), (\d+), '([^']+)'\)/g)].map((m) => m[3]);
  const fromExample = example().modules.flatMap((m) => m.values.map((v) => v.name));
  assert.deepEqual(fromExample, names);
});
