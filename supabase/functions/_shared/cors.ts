// CORS for the Flutter web build (ADR 0001). Origins come from ALLOWED_ORIGINS (comma separated);
// unset means "*" which is fine locally because every request is authorized by bearer token.
const allowedOrigins = (Deno.env.get("ALLOWED_ORIGINS") ?? "*")
  .split(",")
  .map((origin) => origin.trim())
  .filter(Boolean);

export function corsHeaders(req: Request): Record<string, string> {
  const origin = req.headers.get("origin") ?? "";
  const allowOrigin = allowedOrigins.includes("*")
    ? "*"
    : allowedOrigins.includes(origin)
    ? origin
    : allowedOrigins[0] ?? "";
  return {
    "Access-Control-Allow-Origin": allowOrigin,
    "Access-Control-Allow-Headers":
      "authorization, x-client-info, apikey, content-type, x-cron-secret",
    "Access-Control-Allow-Methods": "GET, POST, PATCH, DELETE, OPTIONS",
    "Access-Control-Max-Age": "86400",
    Vary: "Origin",
  };
}

export function preflight(req: Request): Response | null {
  if (req.method !== "OPTIONS") return null;
  return new Response(null, { status: 204, headers: corsHeaders(req) });
}
