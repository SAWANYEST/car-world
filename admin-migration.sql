-- Car World admin features — REVIEW BEFORE APPLYING to SAWANTEST
-- Introduces a privileged, manually assigned user role. Does NOT assign anybody automatically.
-- Existing car records and anonymous public SELECT remain unchanged.
create table if not exists public.site_admins (
  user_id uuid primary key references auth.users(id) on delete cascade,
  created_at timestamptz not null default now()
);

alter table public.site_admins enable row level security;
revoke all on table public.site_admins from public, anon, authenticated;
grant select on table public.site_admins to authenticated;

create policy "Admin can read own membership"
on public.site_admins
for select to authenticated
using (user_id = (select auth.uid()));

alter table public.cars
  add column if not exists image_url text;
alter table public.cars
  add constraint cars_image_url_https
  check (image_url is null or (length(image_url) <= 2048 and image_url ~ '^https://[^[:space:]]+$'));

-- RLS remains enabled on cars. Grant operations at table level only to logged-in role;
-- policies restrict all writes to those explicitly enrolled in site_admins.
grant insert, update, delete on public.cars to authenticated;

create policy "Admins can add cars"
on public.cars for insert to authenticated
with check (exists (select 1 from public.site_admins a where a.user_id = (select auth.uid())));

create policy "Admins can update cars"
on public.cars for update to authenticated
using (exists (select 1 from public.site_admins a where a.user_id = (select auth.uid())))
with check (exists (select 1 from public.site_admins a where a.user_id = (select auth.uid())));

create policy "Admins can delete cars"
on public.cars for delete to authenticated
using (exists (select 1 from public.site_admins a where a.user_id = (select auth.uid())));

-- AFTER the specific user has signed up and confirmed their email, choose the admin:
-- insert into public.site_admins (user_id)
-- select id from auth.users where email = 'ADMIN_EMAIL_GOES_HERE' and email_confirmed_at is not null
-- on conflict (user_id) do nothing;
-- Only run this last statement after confirming identity and explicit user authorization.
