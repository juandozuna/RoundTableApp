// POST /functions/v1/sync-upload — write endpoint of the session domain (ADR 0008/0019).
// The online-only app sends a batch right away; a future offline outbox replays queued batches here.
// Applies a CRUD batch for the session-domain tables; every op is applied or rejected
// independently and idempotently by id. See docs/implementation/api-contract.md.
import { requireCaller } from "../_shared/auth.ts";
import { callApi } from "../_shared/db.ts";
import { messageFor } from "../_shared/errors.ts";
import { json, readJson, serveRoutes } from "../_shared/http.ts";
import { mergeResults, normalizeBatch, type OpResult } from "../_shared/sync_ops.ts";

serveRoutes("sync-upload", [{
  method: "POST",
  pattern: "",
  handler: async (req) => {
    const caller = await requireCaller(req);
    const body = await readJson(req);
    const batch = normalizeBatch(body);
    const total = batch.ops.length + batch.rejected.length;

    let remote: OpResult[] = [];
    if (batch.ops.length) {
      const applied = await callApi<{ results: OpResult[] }>("sync_apply", {
        p_uid: caller.userId,
        p_ops: batch.ops,
      });
      remote = applied.results;
    }
    const results = mergeResults(total, batch.rejected, remote).map((r) =>
      r.status === "rejected" ? { ...r, message: r.message ?? messageFor(r.code ?? "internal_error") } : r
    );
    const rejected = results.filter((r) => r.status === "rejected").length;
    if (rejected) {
      console.warn(`[sync-upload] user ${caller.userId}: ${rejected}/${total} ops rejected`,
        results.filter((r) => r.status === "rejected").map((r) => `${r.table}:${r.code}`));
    }
    return json(req, { applied: total - rejected, rejected, results });
  },
}]);
