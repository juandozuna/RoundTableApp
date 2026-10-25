import { service } from "./db.ts";
import { ApiError } from "./errors.ts";

export interface Caller {
  userId: string;
  email: string | null;
  provider: string | null;
}

export function bearerToken(req: Request): string | null {
  const header = req.headers.get("authorization") ?? "";
  const match = /^Bearer\s+(.+)$/i.exec(header);
  return match ? match[1].trim() : null;
}

/** Verifies the caller's Supabase access token (any provider). Throws unauthenticated. */
export async function requireCaller(req: Request): Promise<Caller> {
  const token = bearerToken(req);
  if (!token) throw new ApiError("unauthenticated");
  const { data, error } = await service().auth.getUser(token);
  if (error || !data?.user) throw new ApiError("unauthenticated");
  return {
    userId: data.user.id,
    email: data.user.email ?? null,
    provider: (data.user.app_metadata?.provider as string | undefined) ?? null,
  };
}

/** Scheduled callers (pg_cron/pg_net, external scheduler): CRON_SECRET header or service key. */
export function requireCron(req: Request): void {
  const secret = Deno.env.get("CRON_SECRET");
  const headerSecret = req.headers.get("x-cron-secret");
  if (secret && headerSecret && headerSecret === secret) return;
  const serviceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
  if (serviceKey && bearerToken(req) === serviceKey) return;
  throw new ApiError("forbidden");
}
