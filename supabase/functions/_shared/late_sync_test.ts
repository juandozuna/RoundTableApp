import { assertEquals } from "jsr:@std/assert@1";
import { decideLateSync, LATE_GRACE_MS, lateAfterClose } from "./late_sync.ts";

const t = (iso: string) => new Date(iso);
const ended = t("2026-10-20T19:30:00Z");

Deno.test("open session: accepted, not late", () => {
  assertEquals(
    decideLateSync({ sessionStatus: "open", sessionEndedAt: null, deviceAt: t("2026-10-20T19:10:00Z"),
      receivedAt: t("2026-10-20T19:11:00Z") }),
    { accept: true, syncedLate: false, deviceAt: t("2026-10-20T19:10:00Z") },
  );
});

Deno.test("captured before close, uploaded after: accepted and synced_late", () => {
  const d = decideLateSync({ sessionStatus: "closed", sessionEndedAt: ended,
    deviceAt: t("2026-10-20T19:20:00Z"), receivedAt: t("2026-10-22T08:00:00Z") });
  assertEquals(d, { accept: true, syncedLate: true, deviceAt: t("2026-10-20T19:20:00Z") });
});

Deno.test("grace window tolerates clock drift", () => {
  const within = new Date(ended.getTime() + LATE_GRACE_MS);
  assertEquals(decideLateSync({ sessionStatus: "closed", sessionEndedAt: ended, deviceAt: within,
    receivedAt: t("2026-10-21T00:00:00Z") }).accept, true);
  const beyond = new Date(ended.getTime() + LATE_GRACE_MS + 1000);
  assertEquals(decideLateSync({ sessionStatus: "closed", sessionEndedAt: ended, deviceAt: beyond,
    receivedAt: t("2026-10-21T00:00:00Z") }), { accept: false, code: "session_closed" });
});

Deno.test("cancelled sessions reject everything", () => {
  assertEquals(decideLateSync({ sessionStatus: "cancelled", sessionEndedAt: null, deviceAt: ended,
    receivedAt: ended }), { accept: false, code: "session_cancelled" });
});

Deno.test("future device clocks are clamped to the server time", () => {
  const d = decideLateSync({ sessionStatus: "scheduled", sessionEndedAt: null,
    deviceAt: t("2030-01-01T00:00:00Z"), receivedAt: t("2026-10-20T19:00:00Z") });
  assertEquals(d, { accept: true, syncedLate: false, deviceAt: t("2026-10-20T19:00:00Z") });
});

Deno.test("an earlier late flag sticks", () => {
  assertEquals(decideLateSync({ sessionStatus: "open", sessionEndedAt: null, deviceAt: ended,
    receivedAt: ended, previouslyLate: true }), { accept: true, syncedLate: true, deviceAt: ended });
});

Deno.test("close arriving after uploads flags rows received after the close", () => {
  assertEquals(lateAfterClose(t("2026-10-20T19:31:00Z"), ended), true);
  assertEquals(lateAfterClose(t("2026-10-20T19:29:00Z"), ended), false);
});
