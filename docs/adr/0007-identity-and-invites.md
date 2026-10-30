# 0007 — Social login, phone number stored unverified, invite binding

> Partly superseded by [ADR 0018](0018-email-password-sign-in.md): production signs in with email +
> password; social login stays implemented but is off unless `AUTH_METHODS` enables it. The phone
> and invite-binding decisions below still stand.

## Decision
- Supabase Auth with Google, Apple and Facebook as the only sign-in methods in v1.
- No phone-number login and no SMS verification, to avoid per-message costs. The phone number
  (PC-15) is stored on the member profile as contact data only (E.164, unverified).
- Facilitators and coordinators pre-register people (name, last name, position, email, phone —
  PC-15). Registration creates an invite (link + short code). Signing in with any provider while
  redeeming the invite binds that identity to the pre-created member. This also works when Apple
  hides the real email.

## Alternatives considered
- Phone OTP as a fallback login: dropped for v1 because SMS is the only per-user variable cost.
- Automatic match by verified email: breaks with Apple private relay and mismatched emails.
- Open signup plus approval: creates orphan accounts and an approval queue.
- WhatsApp OTP: possible later if a non-social login becomes necessary.

## Consequences
- Members without a Google, Apple or Facebook account cannot sign in in v1; revisit after the pilot.
- Invite redemption is online-only (ADR 0003).
