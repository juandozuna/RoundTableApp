# 0018 — Email + password sign-in in production

## Context
ADR 0007 made Google, Apple and Facebook the only sign-in methods. Before launch the owner decided
to skip social login for now: the OAuth consoles (Apple especially) are not ready and members
without those accounts could not enter at all.

## Decision
- **Production signs in with email + password.** Members create their own account from the sign-in
  screen ("Crear cuenta"), can reset a forgotten password by email, and set the new password on a
  "Nueva contraseña" page reached from the emailed link. Everything after sign-in (account lookup,
  "No encontramos tu cuenta", invite redemption, roles, offline window) is unchanged: email sign-in
  produces a Supabase session exactly as OAuth does.
- **The sign-in methods are build configuration.** `--dart-define=AUTH_METHODS=` takes a comma list
  of `email`, `google`, `apple`, `facebook` (default `email`). The sign-in page shows only the
  enabled methods. Social login code stays; enabling it is a rebuild plus provider credentials.
  `DEV_AUTH` and its quick-login chips remain dev-only and compile to `false` in hosted builds.
- **Supabase Auth settings (hosted):** Email provider on, "Allow new users to sign up" on, "Confirm
  email" **off**, minimum password length 8. Supabase's built-in mailer is rate limited, so
  confirmation emails would block sign-ups; with confirmation off an account is signed in
  immediately. `scripts/deploy-hosted.sh --with-auth` applies these settings.
- **Password rules** live in `lib/core/form_rules` (`AppFieldKind.newPassword`: at least 8
  characters; `confirmPassword`: must match). Server errors map to domain failures
  (`invalid_credentials`, `user_already_exists`, `weak_password`, `over_email_send_rate_limit`,
  `email_not_confirmed`, `otp_expired`) with Spanish messages; no raw SDK error reaches a widget.
- **Reset link:** `redirectTo = <app origin>/#/nueva-contrasena` on web (the app uses hash routing),
  the existing deep link on mobile. Supabase's PKCE flow stores the code verifier in the browser, so
  the link has to be opened in the browser that requested it.

## Alternatives considered
- Magic links / email OTP: still depend on the rate-limited mailer for every sign-in.
- Waiting for the social provider credentials: blocks the launch.
- Phone OTP: rejected in ADR 0007 (SMS cost).

## Consequences
- Members now hold a password; the app never sees it (Supabase Auth hashes it) and stores it
  nowhere.
- The built-in mailer limit still applies to password-reset emails. Configure custom SMTP before
  large onboarding waves, then turn "Confirm email" on.
- Anyone can create an account; access still requires an invitation or an existing person row
  (`No encontramos tu cuenta`), so orphan accounts see nothing.
- Weak points to revisit after the pilot: no email confirmation, no rate limiting beyond
  Supabase's, no account deletion or email change flow.
