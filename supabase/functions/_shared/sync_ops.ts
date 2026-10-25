// PowerSync upload batch normalization (pure). The client's uploadData sends CrudEntry objects;
// we accept both PowerSync's JSON shape ({op, type, id, data}) and ours ({op, table, id, data}).
import { ApiError } from "./errors.ts";
import { isUuid, scoreError } from "./validation.ts";

export const SYNC_TABLES = [
  "sessions",
  "session_attendance",
  "member_assessments",
  "member_answers",
  "member_commitments",
] as const;
export type SyncTable = (typeof SYNC_TABLES)[number];

export const MAX_BATCH = 500;

/** Columns owned by the server; dropped from client data before applying. */
export const SERVER_COLUMNS = new Set([
  "organization_id", "round_table_id", "value_id", "received_at", "synced_late", "archived_at",
  "created_at", "updated_at", "source", "recorded_by_person_id", "follow_up_received_at",
  "follow_up_synced_late", "facilitator_person_id", "scheduled_at", "follow_up_value_id",
]);

export interface SyncOp {
  op: "PUT" | "PATCH" | "DELETE";
  table: string;
  id: string;
  data: Record<string, unknown>;
}

export interface OpResult {
  id: string | null;
  table: string | null;
  op: string | null;
  status: "applied" | "rejected";
  code?: string;
  message?: string | null;
}

export interface NormalizedBatch {
  ops: SyncOp[];
  /** Ops rejected before reaching the database (malformed), in input order with their index. */
  rejected: Array<OpResult & { index: number }>;
}

export function normalizeBatch(body: unknown): NormalizedBatch {
  const raw = body && typeof body === "object"
    ? ((body as Record<string, unknown>).batch ?? (body as Record<string, unknown>).operations ??
      (body as Record<string, unknown>).crud)
    : undefined;
  if (!Array.isArray(raw)) throw new ApiError("validation_failed", "El lote de cambios no es válido.");
  if (raw.length > MAX_BATCH) {
    throw new ApiError("validation_failed", `Máximo ${MAX_BATCH} cambios por lote.`);
  }

  const ops: SyncOp[] = [];
  const rejected: NormalizedBatch["rejected"] = [];
  raw.forEach((entry, index) => {
    const e = (entry ?? {}) as Record<string, unknown>;
    const op = String(e.op ?? "").toUpperCase();
    const table = String(e.table ?? e.type ?? "");
    const id = e.id;
    const reject = (code: string) =>
      rejected.push({
        index,
        id: typeof id === "string" ? id : null,
        table: table || null,
        op: op || null,
        status: "rejected",
        code,
      });

    if (!["PUT", "PATCH", "DELETE"].includes(op) || !isUuid(id)) return reject("validation_failed");
    if (!(SYNC_TABLES as readonly string[]).includes(table)) return reject("unsupported_table");
    if (op === "DELETE") return reject("operation_not_allowed");

    const rawData = (e.data ?? e.opData ?? {}) as Record<string, unknown>;
    if (typeof rawData !== "object" || Array.isArray(rawData)) return reject("validation_failed");
    const data: Record<string, unknown> = {};
    for (const [key, value] of Object.entries(rawData)) {
      if (key !== "id" && !SERVER_COLUMNS.has(key)) data[key] = value;
    }
    // PowerSync stores integers in SQLite; scores may arrive as numeric strings.
    if (table === "member_assessments" && "score" in data) {
      const score = typeof data.score === "string" ? Number(data.score) : data.score;
      const error = scoreError(score);
      if (error) return reject(error);
      data.score = score;
    }
    ops.push({ op: op as SyncOp["op"], table, id: id as string, data });
  });
  return { ops, rejected };
}

/** Merges database results with locally rejected ops, preserving the client's order. */
export function mergeResults(
  total: number,
  local: NormalizedBatch["rejected"],
  remote: OpResult[],
): OpResult[] {
  const out: OpResult[] = new Array(total);
  const localByIndex = new Map(local.map((r) => [r.index, r]));
  let next = 0;
  for (let i = 0; i < total; i++) {
    const l = localByIndex.get(i);
    if (l) {
      const { index: _index, ...rest } = l;
      out[i] = rest;
    } else {
      out[i] = remote[next++];
    }
  }
  return out;
}
