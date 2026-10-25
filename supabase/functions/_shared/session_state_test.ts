import { assertEquals } from "jsr:@std/assert@1";
import { normalizeTarget, notifiesMembers, type SessionState, transitionError } from "./session_state.ts";

const s = (status: SessionState["status"], stage: SessionState["stage"]): SessionState => ({ status, stage });

Deno.test("scheduled session opens at any open stage", () => {
  assertEquals(transitionError(s("scheduled", "lobby"), s("open", "lobby")), null);
  assertEquals(transitionError(s("scheduled", "lobby"), s("open", "value")), null);
});

Deno.test("open stages move in either direction", () => {
  assertEquals(transitionError(s("open", "value"), s("open", "follow_up")), null);
  assertEquals(transitionError(s("open", "attendance"), s("open", "commitment")), null);
});

Deno.test("closing", () => {
  assertEquals(transitionError(s("open", "commitment"), s("closed", "closed")), null);
  assertEquals(transitionError(s("scheduled", "lobby"), s("closed", "closed")), null);
  assertEquals(transitionError(s("open", "value"), s("closed", "value")), "invalid_session_transition");
});

Deno.test("terminal states are final", () => {
  assertEquals(transitionError(s("closed", "closed"), s("open", "value")), "session_finalized");
  assertEquals(transitionError(s("cancelled", "lobby"), s("open", "lobby")), "session_finalized");
  assertEquals(transitionError(s("closed", "closed"), s("closed", "closed")), null);
});

Deno.test("cancel only before opening; no way back to scheduled", () => {
  assertEquals(transitionError(s("scheduled", "lobby"), s("cancelled", "lobby")), null);
  assertEquals(transitionError(s("open", "lobby"), s("cancelled", "lobby")), "invalid_session_transition");
  assertEquals(transitionError(s("open", "lobby"), s("scheduled", "lobby")), "invalid_session_transition");
});

Deno.test("normalization mirrors the database", () => {
  assertEquals(normalizeTarget(s("scheduled", "lobby"), { stage: "attendance" }), s("open", "attendance"));
  assertEquals(normalizeTarget(s("open", "value"), { stage: "closed" }), s("closed", "closed"));
  assertEquals(normalizeTarget(s("open", "value"), { status: "closed" }), s("closed", "closed"));
  assertEquals(normalizeTarget(s("scheduled", "lobby"), { stage: "lobby" }), s("scheduled", "lobby"));
});

Deno.test("member notifications only for answer stages", () => {
  assertEquals(["lobby", "attendance", "follow_up", "value", "commitment", "closed"].map((x) =>
    notifiesMembers(x as SessionState["stage"])), [false, true, true, true, true, false]);
});
