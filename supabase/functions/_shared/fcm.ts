// Push transport (ADR 0009). The rest of the backend talks to PushSender only; FCM HTTP v1 is
// one implementation. Without FCM_SERVICE_ACCOUNT_JSON the no-op sender logs a warning and
// reports every message as "skipped" so the outbox does not retry forever.

export interface PushMessage {
  token: string;
  title: string;
  body: string;
  data: Record<string, string>;
}

export type PushOutcome = "sent" | "invalid_token" | "failed" | "skipped";

export interface PushSender {
  readonly name: string;
  send(message: PushMessage): Promise<{ outcome: PushOutcome; error?: string }>;
}

export class NoopPushSender implements PushSender {
  readonly name = "noop";
  private warned = false;
  send(message: PushMessage) {
    if (!this.warned) {
      console.warn("[notifications] FCM_SERVICE_ACCOUNT_JSON not set; push messages are skipped");
      this.warned = true;
    }
    console.info(`[notifications] skip push "${message.title}" → …${message.token.slice(-6)}`);
    return Promise.resolve({ outcome: "skipped" as const });
  }
}

interface ServiceAccount {
  project_id: string;
  client_email: string;
  private_key: string;
}

const base64url = (bytes: Uint8Array | string) =>
  btoa(typeof bytes === "string" ? bytes : String.fromCharCode(...bytes))
    .replace(/\+/g, "-").replace(/\//g, "_").replace(/=+$/, "");

export class FcmPushSender implements PushSender {
  readonly name = "fcm";
  private accessToken: { value: string; expiresAt: number } | null = null;

  constructor(private readonly account: ServiceAccount) {}

  private async token(): Promise<string> {
    if (this.accessToken && this.accessToken.expiresAt > Date.now() + 60_000) {
      return this.accessToken.value;
    }
    const now = Math.floor(Date.now() / 1000);
    const header = base64url(JSON.stringify({ alg: "RS256", typ: "JWT" }));
    const claims = base64url(JSON.stringify({
      iss: this.account.client_email,
      scope: "https://www.googleapis.com/auth/firebase.messaging",
      aud: "https://oauth2.googleapis.com/token",
      iat: now,
      exp: now + 3600,
    }));
    const pem = this.account.private_key.replace(/-----[^-]+-----/g, "").replace(/\s+/g, "");
    const key = await crypto.subtle.importKey(
      "pkcs8",
      Uint8Array.from(atob(pem), (c) => c.charCodeAt(0)),
      { name: "RSASSA-PKCS1-v1_5", hash: "SHA-256" },
      false,
      ["sign"],
    );
    const signature = new Uint8Array(
      await crypto.subtle.sign("RSASSA-PKCS1-v1_5", key, new TextEncoder().encode(`${header}.${claims}`)),
    );
    const response = await fetch("https://oauth2.googleapis.com/token", {
      method: "POST",
      headers: { "Content-Type": "application/x-www-form-urlencoded" },
      body: new URLSearchParams({
        grant_type: "urn:ietf:params:oauth:grant-type:jwt-bearer",
        assertion: `${header}.${claims}.${base64url(signature)}`,
      }),
    });
    if (!response.ok) throw new Error(`oauth ${response.status}: ${await response.text()}`);
    const body = await response.json();
    this.accessToken = { value: body.access_token, expiresAt: Date.now() + body.expires_in * 1000 };
    return this.accessToken.value;
  }

  async send(message: PushMessage) {
    try {
      const response = await fetch(
        `https://fcm.googleapis.com/v1/projects/${this.account.project_id}/messages:send`,
        {
          method: "POST",
          headers: {
            Authorization: `Bearer ${await this.token()}`,
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            message: {
              token: message.token,
              notification: { title: message.title, body: message.body },
              data: message.data,
            },
          }),
        },
      );
      if (response.ok) return { outcome: "sent" as const };
      const text = await response.text();
      // UNREGISTERED / INVALID_ARGUMENT for a token: the device uninstalled or rotated it.
      if (response.status === 404 || (response.status === 400 && text.includes("registration token"))) {
        return { outcome: "invalid_token" as const, error: text.slice(0, 300) };
      }
      return { outcome: "failed" as const, error: `${response.status} ${text.slice(0, 300)}` };
    } catch (error) {
      return { outcome: "failed" as const, error: String(error).slice(0, 300) };
    }
  }
}

export function pushSenderFromEnv(): PushSender {
  const raw = Deno.env.get("FCM_SERVICE_ACCOUNT_JSON");
  if (!raw) return new NoopPushSender();
  try {
    return new FcmPushSender(JSON.parse(raw) as ServiceAccount);
  } catch {
    console.warn("[notifications] FCM_SERVICE_ACCOUNT_JSON is not valid JSON; using no-op sender");
    return new NoopPushSender();
  }
}

/** FCM data payloads must be string → string. */
export function stringifyData(data: Record<string, unknown>): Record<string, string> {
  return Object.fromEntries(
    Object.entries(data).filter(([, v]) => v !== null && v !== undefined)
      .map(([k, v]) => [k, typeof v === "string" ? v : JSON.stringify(v)]),
  );
}

interface OutboxRow {
  id: string;
  kind: string;
  title: string;
  body: string;
  data: Record<string, unknown>;
  tokens: Array<{ token: string; platform: string }>;
}

/** Sends claimed outbox rows; returns results for api.notifications_complete. */
export async function deliver(sender: PushSender, rows: OutboxRow[]) {
  const results: Array<{ id: string; status: "sent" | "skipped" | "failed"; error?: string }> = [];
  const invalidTokens: string[] = [];
  for (const row of rows) {
    if (!row.tokens.length) {
      results.push({ id: row.id, status: "skipped", error: "no device tokens" });
      continue;
    }
    const outcomes = await Promise.all(row.tokens.map(async ({ token }) => {
      const r = await sender.send({ token, title: row.title, body: row.body, data: stringifyData(row.data) });
      if (r.outcome === "invalid_token") invalidTokens.push(token);
      return r;
    }));
    if (outcomes.some((o) => o.outcome === "sent")) results.push({ id: row.id, status: "sent" });
    else if (outcomes.every((o) => o.outcome === "skipped" || o.outcome === "invalid_token")) {
      results.push({ id: row.id, status: "skipped" });
    } else {
      results.push({ id: row.id, status: "failed", error: outcomes.find((o) => o.error)?.error });
    }
  }
  return { results, invalidTokens };
}
