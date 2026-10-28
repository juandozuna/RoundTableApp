import { assertEquals } from "jsr:@std/assert@1";
import { ApiError, fromPostgrestError } from "./errors.ts";
import { matchRoute, routeSegments } from "./http.ts";

Deno.test("business errors keep the database code and Spanish detail", () => {
  const e = fromPostgrestError({ code: "P0001", message: "table_full", details: "La mesa ya tiene 9 personas." });
  assertEquals([e.code, e.status, e.userMessage], ["table_full", 409, "La mesa ya tiene 9 personas."]);
});

Deno.test("constraint violations map to stable codes", () => {
  const unique = (c: string) =>
    fromPostgrestError({ code: "23505", message: `duplicate key value violates unique constraint "${c}"` }).code;
  assertEquals(unique("round_tables_org_code_key"), "duplicate_table_code");
  assertEquals(unique("member_assessments_session_person_kind_key"), "duplicate_assessment");
  assertEquals(unique("invites_pkey"), "duplicate_id");
  assertEquals(fromPostgrestError({ code: "23514", message: 'violates check constraint "member_assessments_score_check"' }).code,
    "score_out_of_range");
  assertEquals(fromPostgrestError({ code: "22P02", message: "invalid input syntax for type uuid" }).status, 422);
  assertEquals(fromPostgrestError({ code: "XX000", message: "boom" }).status, 500);
});

Deno.test("http status per code family", () => {
  assertEquals(new ApiError("unauthenticated").status, 401);
  assertEquals(new ApiError("invite_expired").status, 410);
  assertEquals(new ApiError("score_five_not_allowed").status, 422);
  assertEquals(new ApiError("value_rewind_confirmation_required").status, 409);
  assertEquals(new ApiError("slot_taken").status, 409);
  assertEquals(new ApiError("session_in_progress").status, 409);
  assertEquals(new ApiError("schedule_in_past").status, 422);
  assertEquals(new ApiError("extra_session_not_before_next").status, 422);
});

Deno.test("router strips the function prefix and matches params", () => {
  assertEquals(routeSegments("/functions/v1/admin/tables/abc/facilitator", "admin"), ["tables", "abc", "facilitator"]);
  assertEquals(routeSegments("/admin", "admin"), []);
  const h = () => Promise.resolve(new Response());
  const routes = [
    { method: "POST", pattern: "tables/:id/facilitator", handler: h },
    { method: "PATCH", pattern: "tables/:id", handler: h },
  ];
  const found = matchRoute(routes, "POST", ["tables", "abc", "facilitator"]);
  assertEquals(found && "params" in found ? found.params : null, { id: "abc" });
  assertEquals(matchRoute(routes, "GET", ["tables", "abc"]), { allowed: ["PATCH"] });
  assertEquals(matchRoute(routes, "GET", ["nope"]), null);
});

Deno.test("role matrix denials keep their typed code and map to 403", () => {
  for (const code of ["invite_role_forbidden", "invite_table_forbidden"]) {
    const e = fromPostgrestError({ code: "P0001", message: code, details: "Detalle en español." });
    assertEquals([e.code, e.status, e.userMessage], [code, 403, "Detalle en español."]);
    assertEquals(new ApiError(code).status, 403);
  }
});
