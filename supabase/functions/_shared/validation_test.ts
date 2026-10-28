import { assertEquals, assertThrows } from "jsr:@std/assert@1";
import { ApiError } from "./errors.ts";
import { normalizeInviteCode, scoreError, validate } from "./validation.ts";

Deno.test("score rule: integers 1–10 except 5", () => {
  for (const ok of [1, 2, 3, 4, 6, 7, 8, 9, 10]) assertEquals(scoreError(ok), null);
  assertEquals(scoreError(5), "score_five_not_allowed");
  for (const bad of [0, 11, -1, 4.5, "7", null, undefined]) assertEquals(scoreError(bad), "score_out_of_range");
});

Deno.test("invite codes are normalized and use the unambiguous alphabet", () => {
  assertEquals(normalizeInviteCode(" mesa-34 "), "MESA34");
  validate({ code: "MESA34" }, (v) => v.inviteCode("code"));
  for (const bad of ["MESA3", "MES O34", "ABC10I", 123]) {
    assertThrows(() => validate({ code: bad }, (v) => v.inviteCode("code")), ApiError);
  }
});

Deno.test("person input: names required, E.164 phone, email format", () => {
  const error = assertThrows(
    () =>
      validate({ person: { first_name: "", last_name: "Paz", phone: "809-555-1234", email: "x@" } }, (v) =>
        v.personRef()),
    ApiError,
  );
  assertEquals(error.code, "validation_failed");
  const fields = error.extra?.fields as Record<string, string>;
  assertEquals(Object.keys(fields).sort(), ["person.email", "person.first_name", "person.phone"]);
  validate({ person: { first_name: "Rodrigo", last_name: "Paz", phone: "+18095551234" } }, (v) => v.personRef());
  validate({ person_id: "0f8fad5b-d9cb-469f-a165-70867728950e" }, (v) => v.personRef());
});

Deno.test("table schedule fields", () => {
  validate({ code: "luz-03", weekday: 1, start_time: "19:00" }, (v) =>
    v.tableCode("code").int("weekday", 1, 7).time("start_time"));
  const error = assertThrows(
    () => validate({ code: "x", weekday: 8, start_time: "25:00" }, (v) =>
      v.tableCode("code").int("weekday", 1, 7).time("start_time")),
    ApiError,
  );
  assertEquals(Object.keys(error.extra?.fields as object).sort(), ["code", "start_time", "weekday"]);
});

Deno.test("schedule change dates", () => {
  validate({ schedule_effective_from: "2026-11-02", scheduled_at: "2026-11-02T23:00:00Z" }, (v) =>
    v.date("schedule_effective_from").timestamp("scheduled_at", true));
  for (const bad of ["2026-13-01", "02/11/2026", "2026-02-30x", 20261102]) {
    const error = assertThrows(() => validate({ schedule_effective_from: bad }, (v) => v.date("schedule_effective_from")), ApiError);
    assertEquals(Object.keys(error.extra?.fields as object), ["schedule_effective_from"]);
  }
  assertThrows(() => validate({}, (v) => v.timestamp("scheduled_at", true)), ApiError);
  validate({ scheduled_local: "2026-11-02T19:30" }, (v) => v.local("scheduled_local", true));
  for (const bad of ["2026-11-02 19:30", "2026-11-02T25:00", "2026-11-02", 5]) {
    assertThrows(() => validate({ scheduled_local: bad }, (v) => v.local("scheduled_local", true)), ApiError);
  }
});
