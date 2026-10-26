/**
 * Best-effort client address behind the Supabase gateway, used only to bucket anonymous or
 * abuse-prone calls. `x-forwarded-for` is appended to by every proxy, so its *first* entry is
 * whatever the client claimed and rotating it would dodge a per-address limit; trust, in order,
 * the CDN's single-valued header, the gateway's, and finally the *last* forwarded entry (the
 * address our own gateway saw).
 */
export function clientAddressFrom(headers: Headers): string {
  const single = headers.get("cf-connecting-ip")?.trim() || headers.get("x-real-ip")?.trim();
  if (single) return single;
  const forwarded = headers.get("x-forwarded-for")?.split(",").map((p) => p.trim()).filter(Boolean);
  return forwarded?.length ? forwarded[forwarded.length - 1] : "unknown";
}
