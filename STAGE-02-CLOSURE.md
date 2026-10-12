# Stage 02 — Supabase Integration | Closure & Handoff

**Project:** Car World (training-only)  
**Status:** Implementation complete in development branch; browser-to-real-Supabase end-to-end test pending Preview.  
**GitHub repository:** SAWANYEST/car-world  
**Branch:** feat/car-catalog-supabase  
**PR:** https://github.com/SAWANYEST/car-world/pull/1 (open; not merged)  
**Supabase project:** SAWANTEST  
**Schema:** public.cars (6 training records)  
**Production:** No deployment or changes to GitHub main in Stage 02.

## Implemented
1. Set `supabase-config.js` to the actual SAWANTEST project URL and an **active public publishable key**. Only public client configuration is committed; no secret/service_role key.
2. Existing `index.html` requests `GET /rest/v1/cars` via `apikey` header, loads records, and renders search, filters, details.
3. Existing interface includes a user-facing notice and demo-data fallback if the HTTP request fails.
4. Updated PROJECT.md with accurate integration status.

## Evidence and tests
- Live database SQL in a **read-only transaction** with effective role `anon` returned 6 visible cars including a Toyota Camry.
- Database RLS enabled; grants/policies checked at Stage 01: read-only for `anon` and `authenticated`.
- Browser-driven test with a mocked REST response in headless Chromium passed: REST URL and header, 6 cards, sedan filter (4), Arabic search, details dialog, no JavaScript errors, fallback on HTTP 503.
- Inspected the GitHub `supabase-config.js` file after commit: Supabase URL and publishable key present, no detected secret/service_role key pattern.
- Checked GitHub `main` still contains only README.md. Development PR remains open and unmerged.

## Not yet tested
- Browser HTTPS request to **real** Supabase REST endpoint and response/CORS handling, because this execution environment cannot access external DNS/network.
- Vercel Preview deployment and browser Network/Console inspection.
- Production deployment is not part of this stage.

## Acceptance gate for next stage
1. Deploy **Preview only** from development branch after explicit user approval.
2. Open Preview and confirm status text says data is from Supabase, and 6 cards are loaded.
3. Inspect an actual successful GET `/rest/v1/cars` (200) in browser network tooling or logs; verify UI searches/filters and no console errors.
4. Obtain separate user approval before merge to `main` or Production release.

## Risk and rollback
- Public `anon` SELECT is deliberate for an open catalogue; never store private records in `cars`.
- If public browser access must be disabled, remove/restrict SELECT policy and grants through reviewed migration after approval.
- Revert the development config commit or blank its URL/key to return the site to local demo data. No main or Production rollback required as of Stage 02.
