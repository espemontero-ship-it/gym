-- Run this once in the Supabase SQL editor (Project → SQL Editor → New query).

create table if not exists workout_logs (
  id uuid primary key default gen_random_uuid(),
  day text not null,
  log_date date not null,
  weights jsonb not null default '{}'::jsonb,
  cardio jsonb not null default '{}'::jsonb,
  done jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  unique (day, log_date)
);

-- If the table already existed from an earlier version of this app (without the
-- "done" column, used to persist which exercises are checked off), add it now.
alter table workout_logs add column if not exists done jsonb not null default '{}'::jsonb;

-- "sets" replaces the old single-value "weights" column going forward: it holds,
-- per exercise index, an array of {kg, reps} — one entry per prescribed set.
-- "notes" holds a short free-text note per exercise index. Old rows keep using
-- "weights" as-is (single kg per exercise, no reps/notes) and are left untouched.
alter table workout_logs add column if not exists sets jsonb not null default '{}'::jsonb;
alter table workout_logs add column if not exists notes jsonb not null default '{}'::jsonb;

-- This app has no login screen — the anon key is the only credential, used
-- directly from the browser. RLS is enabled with a permissive policy so the
-- page can read/write its own log rows; there's nothing sensitive here beyond
-- personal workout weights, and the table only exists in this Supabase project.
alter table workout_logs enable row level security;

create policy "anon can read workout logs"
  on workout_logs for select
  to anon
  using (true);

create policy "anon can write workout logs"
  on workout_logs for insert
  to anon
  with check (true);

create policy "anon can update workout logs"
  on workout_logs for update
  to anon
  using (true)
  with check (true);
