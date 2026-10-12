# Stage 03 — Simple Supabase Auth (Development)

**Status:** implemented and locally mock-tested; real authentication end-to-end test pending.  
**Source:** `SAWANYEST/car-world`, branch `feat/car-catalog-supabase`.  
**Review:** https://github.com/SAWANYEST/car-world/pull/1 (open, unmerged).  
**Production:** NOT deployed, and `main` is unchanged.

## Scope
- A compact, Arabic RTL dialog on the catalogue home page for user signup and password login, plus a visible sign-out action.
- Calls to Supabase Auth REST endpoints: `/auth/v1/signup`, `/auth/v1/token?grant_type=password`, `/auth/v1/user`, `/auth/v1/token?grant_type=refresh_token`, and `/auth/v1/logout`.
- Client-side public publishable key from existing `supabase-config.js`. No admin credentials, secret keys, service role or SQL schema changes.
- Session tokens are kept in this tab's `sessionStorage`, not printed or sent anywhere other than the configured Supabase HTTPS endpoint. Simple refresh and restored-session validation.
- The existing six-car catalogue and read-only database remain unchanged.
- Supports default email confirmation: a signup without a session shows a check-email message.

## Local verification (Chromium, mocked API)
- Signup confirmation message: PASS.
- Password login error and success: PASS.
- Signed-in email and sign-out: PASS.
- UI on 390px mobile screen without horizontal overflow: PASS.
- No uncaught JS errors in mock tests: PASS.
- Automatic refresh of an expired saved session: PASS (mock).
- Node syntax verification of all inline JS: PASS.

## Not yet demonstrated
- Live signup and sign-in with a real test mailbox in hosted Supabase (intentionally no accounts were created).
- Email delivery and callback / Auth Site URL / redirect allow-list; these may require dashboard setup.
- Browser-to-real-Supabase API and Vercel preview due to outstanding deployment-access issue.
- Production readiness or comprehensive auth security audit.

## Completion criteria / rollback
Before declaring real login tested, open a development preview, register a temporary non-sensitive test mailbox, verify email as needed, sign in, sign out, refresh and review HTTP/network results. No password should be shared in a chat or logs. Obtain separate approval for Preview and then again for Production. To roll back, revert the `index.html` auth commit on the feature branch; do not delete users or change Supabase Auth configuration without authorization.

## Branch audit
`main` remained at commit `df15f4a6c559a087e4b2a1acbc383e5992882b06` at the time of local implementation check.
