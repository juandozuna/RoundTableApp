#!/usr/bin/env node
// Signs in as a dev user through GoTrue, opens a PowerSync sync stream (HTTP API) and prints what
// that user would download. Exits non-zero if the expected table is missing.
//
//   SUPABASE_URL=… SUPABASE_ANON_KEY=… POWERSYNC_URL=… \
//     node scripts/powersync-sync-check.mjs [email] [expected text in the data]
//
// Defaults: facil@dev.local, "Mesa Esperanza 03". Password: DEV_PASSWORD or dev-password-123.
// Requires Node >= 18 (global fetch).

const supabaseUrl = process.env.SUPABASE_URL ?? 'http://127.0.0.1:54321';
const anonKey = process.env.SUPABASE_ANON_KEY;
const powerSyncUrl = process.env.POWERSYNC_URL ?? 'http://127.0.0.1:8080';
const email = process.argv[2] ?? 'facil@dev.local';
const expected = process.argv[3] ?? 'Mesa Esperanza 03';
const password = process.env.DEV_PASSWORD ?? 'dev-password-123';
if (!anonKey) throw new Error('SUPABASE_ANON_KEY is required');

const login = await fetch(`${supabaseUrl}/auth/v1/token?grant_type=password`, {
  method: 'POST',
  headers: { apikey: anonKey, 'Content-Type': 'application/json' },
  body: JSON.stringify({ email, password }),
});
if (!login.ok) throw new Error(`GoTrue sign-in failed for ${email}: ${login.status} ${await login.text()}`);
const { access_token: token } = await login.json();

const abort = new AbortController();
const timer = setTimeout(() => abort.abort(), 30_000);
const response = await fetch(`${powerSyncUrl}/sync/stream`, {
  method: 'POST',
  signal: abort.signal,
  headers: { Authorization: `Token ${token}`, 'Content-Type': 'application/json' },
  body: JSON.stringify({
    buckets: [],
    include_checksum: true,
    raw_data: true,
    client_id: 'dev-check',
    streams: { include_defaults: true, subscriptions: [] },
  }),
});
if (!response.ok) throw new Error(`PowerSync /sync/stream: ${response.status} ${await response.text()}`);

const rowsByTable = {};
let found = false;
let streams = [];
let buffer = '';
const decoder = new TextDecoder();
read: for await (const chunk of response.body) {
  buffer += decoder.decode(chunk, { stream: true });
  let newline;
  while ((newline = buffer.indexOf('\n')) >= 0) {
    const line = buffer.slice(0, newline).trim();
    buffer = buffer.slice(newline + 1);
    if (!line) continue;
    const message = JSON.parse(line);
    if (message.checkpoint) streams = message.checkpoint.streams.map((s) => s.name);
    for (const op of message.data?.data ?? []) {
      if (op.op !== 'PUT') continue;
      rowsByTable[op.object_type] = (rowsByTable[op.object_type] ?? 0) + 1;
      if (op.data.includes(expected)) found = true;
    }
    if (message.checkpoint_complete) break read;
  }
}
clearTimeout(timer);
abort.abort();

console.log(`${email}: streams = ${streams.join(', ')}`);
console.log(`${email}: rows per table =`, rowsByTable);
if (!found) {
  console.error(`✗ "${expected}" not found in the downloaded data`);
  process.exit(1);
}
console.log(`✓ "${expected}" is part of the downloaded data`);
