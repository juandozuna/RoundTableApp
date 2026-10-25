# Workflow 1 — Login, invites and context switching

Cover end to end:
1. Inviting (facilitator on phone, coordinator/admin on desktop): pre-register a person (Nombre,
   Apellido, Cargo opcional, Correo, Teléfono with country code — unverified), choose role/scope
   (coordinator/admin may invite facilitators/coordinators; facilitator only members of own table;
   respect 9-seat limit incl. facilitator), then share the invite (copy link, WhatsApp, QR, code),
   see invite status list (pendiente, aceptada, vencida, revocada) with resend/revoke.
2. Redeeming (new user on phone): open invite link OR type code → welcome card showing who invited
   them, organization, table, role → choose Google / Apple / Facebook → bind → confirm/edit
   profile (prefilled) → land in their context.
3. Returning sign-in: choose provider → if multiple roles/scopes, context picker → home.
4. Context switcher inside the app (switch between e.g. Coordinador · Fundación Luz and
   Miembro · Mesa Esperanza 03), and sign-out (warn if this phone has unsynced session data).
Error/edge states: invite expired, already used, revoked, code typo, provider account already
linked to another member, Apple hidden email ("Ocultar mi correo"), provider cancelled,
offline during first sign-in (needs internet), no role assigned yet, account deactivated.
