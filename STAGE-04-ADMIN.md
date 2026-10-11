# Stage 04 — Dashboard to Manage Cars (development only)

## What is implemented
- `admin.html`: a simple Arabic dashboard with create/edit/delete car forms and optional car image URL.
- `index.html`: reads `image_url` from Supabase, falling back to matching Wikimedia imagery; only shows the admin link if the logged-in user's JWT can read their row in `public.site_admins`.
- `admin-migration.sql`: **prepared but NOT applied**. Creates `public.site_admins` membership table, RLS read-own policy, grants signed-in users write privileges on cars *only subject to explicit RLS membership policy*, and adds `image_url` column.
- Existing public catalogue READ access is maintained.

## Security
1. All admin actions use the logged-in user's Supabase Auth access token. Only public publishable key is in the browser.
2. The server-side RLS policy checks the calling user's `auth.uid()` against `public.site_admins` on each INSERT, UPDATE and DELETE. Hiding the menu link alone is NOT the security barrier.
3. The site_admins table grants signed-in users SELECT on their own row only; browser roles receive no INSERT, UPDATE or DELETE on that table.
4. No user is automatically an administrator just because they sign up; after the user creates/verifies their real account, an owner must manually enroll the verified user UUID.
5. Real users, administrator identities and credentials have not been created/modified during this stage.

## Verification performed
- Checked existing SAWANTEST `public.cars`: 6 rows, RLS enabled, only public SELECT policy and only SELECT grants to anonymous and authenticated roles before any change.
- Fetched changed GitHub files and verified both HTML JS scripts compile using `new Function(...)`.
- Static checks for API methods, JWT authorization, admin access check, dynamic image URL, no hard-coded service role key, no unauthorized SQL grant or auto-admin assignment: passed.
- **NOT tested:** live CRUD, login flow, browser display, or migration execution. These depend on explicit user approval and an authenticated administrator account.

## Next steps — obtain approval FIRST
1. User chooses the account email intended to be the site owner. Never ask for or store the password.
2. User explicitly approves applying `admin-migration.sql` to SAWANTEST (a real schema and RLS/GRANT change).
3. Apply the reviewed migration; verify admin membership rows are initially zero, guests cannot write, authenticated ordinary users cannot write, admins permissions apply correctly.
4. After a genuine account has signed up and email was confirmed, add **only the verified user's UUID** to `public.site_admins` with separate user authorization. Re-verify security and form behavior.
5. Obtain explicit deployment permission to release `admin.html` and updated `index.html` to Vercel Production; do not merge `main` without permission.
