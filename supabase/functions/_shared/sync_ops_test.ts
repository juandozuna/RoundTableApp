import { assertEquals, assertThrows } from "jsr:@std/assert@1";
import { ApiError } from "./errors.ts";
import { mergeResults, normalizeBatch } from "./sync_ops.ts";

const id = (n: number) => `00000000-0000-4000-8000-${String(n).padStart(12, "0")}`;

Deno.test("accepts PowerSync CrudEntry shape and strips server-owned columns", () => {
  const { ops, rejected } = normalizeBatch({
    batch: [{ op: "put", type: "member_assessments", id: id(1),
      opData: { session_id: id(2), person_id: id(3), kind: "initial", score: "7", synced_late: 1,
                received_at: "x", organization_id: id(9) } }],
  });
  assertEquals(rejected, []);
  assertEquals(ops, [{ op: "PUT", table: "member_assessments", id: id(1),
    data: { session_id: id(2), person_id: id(3), kind: "initial", score: 7 } }]);
});

Deno.test("rejects malformed ops locally without failing the batch", () => {
  const { ops, rejected } = normalizeBatch({
    operations: [
      { op: "PUT", table: "organizations", id: id(1), data: {} },
      { op: "DELETE", table: "member_answers", id: id(2) },
      { op: "PUT", table: "member_assessments", id: id(3), data: { score: 5 } },
      { op: "PATCH", table: "sessions", id: "not-a-uuid", data: {} },
      { op: "PATCH", table: "sessions", id: id(5), data: { stage: "value" } },
    ],
  });
  assertEquals(rejected.map((r) => [r.index, r.code]), [
    [0, "unsupported_table"], [1, "operation_not_allowed"], [2, "score_five_not_allowed"], [3, "validation_failed"],
  ]);
  assertEquals(ops.map((o) => o.id), [id(5)]);
});

Deno.test("batch envelope is validated", () => {
  assertThrows(() => normalizeBatch({}), ApiError);
  assertThrows(() => normalizeBatch({ batch: new Array(501).fill({}) }), ApiError);
});

Deno.test("results keep the client's op order", () => {
  const { rejected } = normalizeBatch({
    batch: [
      { op: "PUT", table: "member_answers", id: id(1), data: {} },
      { op: "DELETE", table: "member_answers", id: id(2) },
      { op: "PUT", table: "member_answers", id: id(3), data: {} },
    ],
  });
  const merged = mergeResults(3, rejected, [
    { id: id(1), table: "member_answers", op: "PUT", status: "applied" },
    { id: id(3), table: "member_answers", op: "PUT", status: "applied" },
  ]);
  assertEquals(merged.map((r) => [r.id, r.status]), [[id(1), "applied"], [id(2), "rejected"], [id(3), "applied"]]);
});
