// 1) Parses powersync/sync-rules.yaml with PowerSync's own compiler against the live schema.
// 2) Replays every published row through the rules (data + parameter evaluation) and resolves
//    the buckets of seeded users, asserting what each device would download.
// Run through validate.sh (needs a fresh snapshot of the seeded local database).
import { readFileSync } from "node:fs";
import { createHash } from "node:crypto";
import {
  DEFAULT_HYDRATION_STATE, RequestJwtPayload, RequestParameters, SqlSyncRules, StaticSchema,
} from "@powersync/service-sync-rules";

const snap = (name) => JSON.parse(readFileSync(new URL(`./.snapshot/${name}.json`, import.meta.url), "utf8"));
const sqliteType = (t) =>
  ["smallint", "integer", "bigint", "boolean"].includes(t) ? "integer"
    : ["real", "double precision", "numeric"].includes(t) ? "real" : "text";

// ── 1. Parse and validate ────────────────────────────────────────────────────────────────────
const columns = snap("schema");
const tables = [...new Set(columns.map((c) => c.table))];
const schema = new StaticSchema([{
  tag: "default",
  schemas: [{
    name: "public",
    tables: tables.map((name) => ({
      name,
      columns: columns.filter((c) => c.table === name)
        .map((c) => ({ name: c.name, sqlite_type: sqliteType(c.type), internal_type: c.type })),
    })),
  }],
}]);
const yaml = readFileSync(new URL("../sync-rules.yaml", import.meta.url), "utf8");
const { config, errors } = SqlSyncRules.fromYaml(yaml, { schema, defaultSchema: "public", throwOnError: false });
for (const e of errors) console.log(`${e.type === "warning" ? "warning" : "ERROR"}: ${e.message}`);
const fatal = errors.filter((e) => e.type !== "warning");
if (fatal.length) {
  console.log(`FAILED: ${fatal.length} error(s) in sync-rules.yaml`);
  process.exit(1);
}
console.log(`ok   sync-rules.yaml compiles against ${tables.length} published tables (${errors.length} warnings)`);

// ── 2. Simulate ──────────────────────────────────────────────────────────────────────────────
const sync = config.hydrate({ hydrationState: DEFAULT_HYDRATION_STATE, sqlite: null });
const ref = (name) => ({ connectionTag: "default", schema: "public", name });
const toSqlite = (row) =>
  Object.fromEntries(Object.entries(row).map(([k, v]) => [
    k,
    v === null ? null : typeof v === "boolean" ? (v ? 1n : 0n)
      : typeof v === "number" ? (Number.isInteger(v) ? BigInt(v) : v)
      : typeof v === "object" ? JSON.stringify(v) : String(v),
  ]));

const bucketRows = new Map(); // bucket id → [{table, id, data}]
const lookups = new Map(); // lookup key → bucket parameter rows
for (const table of tables) {
  for (const raw of snap(table)) {
    const record = toSqlite(raw);
    for (const r of sync.evaluateRow({ sourceTable: ref(table), record })) {
      if (!bucketRows.has(r.bucket)) bucketRows.set(r.bucket, []);
      bucketRows.get(r.bucket).push({ table: r.table, id: r.id, data: r.data });
    }
    for (const p of sync.evaluateParameterRow(ref(table), record)) {
      const key = p.lookup.serializedRepresentation;
      if (!lookups.has(key)) lookups.set(key, []);
      lookups.get(key).push(...p.bucketParameters);
    }
  }
}

async function download(userId) {
  const globalParameters = new RequestParameters(new RequestJwtPayload({ sub: userId }), {});
  const { querier, errors: qErrors } = sync.getBucketParameterQuerier({
    globalParameters, hasDefaultStreams: true, streams: {},
  });
  if (qErrors.length) throw new Error(qErrors.map((e) => e.message).join("; "));
  const dynamic = await querier.queryDynamicBucketDescriptions({
    getParameterSets: async (requested) =>
      requested.map((lookup) => ({ lookup, rows: lookups.get(lookup.serializedRepresentation) ?? [] })),
  });
  const buckets = [...querier.staticBuckets, ...dynamic].map((b) => b.bucket);
  const rows = new Map(); // "table:id" → data
  for (const b of buckets) for (const r of bucketRows.get(b) ?? []) rows.set(`${r.table}:${r.id}`, r);
  const byTable = (t) => [...rows.values()].filter((r) => r.table === t).map((r) => r.data);
  return { buckets, byTable };
}

const id = (label) => {
  const h = createHash("md5").update(`gold-roundtables:${label}`).digest("hex");
  return `${h.slice(0, 8)}-${h.slice(8, 12)}-${h.slice(12, 16)}-${h.slice(16, 20)}-${h.slice(20)}`;
};
let failures = 0;
const check = (desc, ok) => {
  console.log(`${ok ? "ok  " : "FAIL"} ${desc}`);
  if (!ok) failures++;
};
const all = (rows, pred) => rows.length > 0 && rows.every(pred);

const luz03 = id("table:luz-03");
const ana = await download(id("user:ana"));
check("member: curriculum (48 values) is synced", ana.byTable("curriculum_values").length === 48);
check("member: content languages and every translation are synced (ADR 0017)",
  ana.byTable("content_locales").some((r) => r.code === "es" && r.is_default)
    && ana.byTable("curriculum_translations").length === snap("curriculum_translations").length);
check("member: only own answers", all(ana.byTable("member_answers"), (r) => r.person_id === id("person:ana")));
check("member: only own scores", all(ana.byTable("member_assessments"), (r) => r.person_id === id("person:ana")));
check("member: own previous commitment available for follow-up",
  ana.byTable("member_commitments").some((r) => r.session_id === id("session:luz-03:3")));
check("member: roster of own table (names only, no auth ids)",
  all(ana.byTable("table_members"), (r) => r.round_table_id === luz03 && !("auth_user_id" in r)));
check("member: sessions of own table only, incl. the pending one",
  all(ana.byTable("sessions"), (r) => r.round_table_id === luz03)
    && ana.byTable("sessions").some((r) => r.status === "scheduled"));
check("member: only own people row (no peers' contact data)",
  ana.byTable("people").length === 1 && ana.byTable("people")[0].id === id("person:ana"));
check("member: only own organization", all(ana.byTable("organizations"), (r) => r.id === id("org:luz")));

const facil = await download(id("user:facil"));
const tableAnswers = snap("member_answers").filter((r) => r.round_table_id === luz03 && !r.archived_at).length;
check("facilitator: every answer of their table", facil.byTable("member_answers").length === tableAnswers);
check("facilitator: nothing from other tables",
  all(facil.byTable("member_assessments"), (r) => r.round_table_id === luz03));
check("facilitator: attendance of their table", facil.byTable("session_attendance").length > 0);

const coord = await download(id("user:coord"));
check("coordinator: offline data only for the table they belong to (Mesa Fe 01, as member)",
  all(coord.byTable("round_tables"), (r) => r.id === id("table:luz-01")));
check("coordinator: no other members' answers offline (reveal is online + audited)",
  coord.byTable("member_answers").every((r) => r.person_id === id("person:coord")));

const hor = await download(id("user:coord-horizonte"));
check("other organization: nothing from Fundación Luz",
  [...["organizations", "round_tables", "sessions", "member_answers", "people"]]
    .every((t) => hor.byTable(t).every((r) => (r.organization_id ?? r.id) !== id("org:luz"))));

const admin = await download(id("user:admin"));
check("platform admin: no tenant session data offline (admin is online-only)",
  admin.byTable("member_answers").length === 0 && admin.byTable("sessions").length === 0);

const stranger = await download("00000000-0000-0000-0000-00000000dead");
check("unknown user: only curriculum",
  stranger.byTable("people").length === 0 && stranger.byTable("sessions").length === 0
    && stranger.byTable("curriculum_modules").length === 5
    && stranger.byTable("content_locales").length > 0);

const archived = snap("member_answers").filter((r) => r.archived_at).length;
console.log(`info ${bucketRows.size} buckets, ${archived} archived answer rows excluded`);
console.log(failures ? `FAILED: ${failures} check(s)` : "OK: sync rules validated and simulated");
process.exit(failures ? 1 : 0);
