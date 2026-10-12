-- Car World - Supabase database initialization (training project)
-- Run in your own Supabase project SQL Editor after review.
-- A public visitor can READ cars only. No anonymous inserts, updates or deletes.

create table if not exists public.cars (
  id uuid primary key default gen_random_uuid(),
  brand text not null,
  model text not null,
  year integer not null check (year between 1950 and 2100),
  engine_liters numeric(3,1) not null check (engine_liters > 0),
  price_sar numeric(12,2) not null check (price_sar >= 0),
  category text not null check (category in ('sedan','suv','crossover')),
  color text not null default '#bfced8',
  created_at timestamptz not null default now(),
  unique (brand, model, year)
);

alter table public.cars enable row level security;

-- Allows read-only access from public browser clients.
drop policy if exists "Public can read cars" on public.cars;
create policy "Public can read cars" on public.cars
for select to anon, authenticated using (true);

-- Explicitly revoke write permissions from public client roles.
revoke insert, update, delete, truncate on table public.cars from anon, authenticated;
grant select on table public.cars to anon, authenticated;

-- Illustrative data only: prices/specifications are NOT verified market figures.
insert into public.cars (brand, model, year, engine_liters, price_sar, category, color)
values
 ('تويوتا','كامري',2025,2.5,113000,'sedan','#d8e1e8'),
 ('هيونداي','سوناتا',2025,2.5,110000,'sedan','#a7b9c7'),
 ('فورد','تورس',2025,2.0,135000,'sedan','#8199ad'),
 ('تويوتا','لاندكروزر',2025,3.5,270000,'suv','#d3c7b4'),
 ('كيا','سبورتاج',2025,2.0,105000,'crossover','#97b4b2'),
 ('نيسان','ألتيما',2025,2.5,111000,'sedan','#b5bbc8')
on conflict (brand, model, year) do nothing;
