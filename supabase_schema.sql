-- ACIS Transcript System
create extension if not exists "uuid-ossp";

create table if not exists students (
  id uuid primary key default uuid_generate_v4(),
  student_id text unique not null,
  title text not null check (title in ('Mr.','Miss','Mrs.','Ms.')),
  student_name text not null,
  nationality text,
  date_of_birth date,
  entry_date date,
  graduation_date date,
  created_at timestamptz default now()
);

create table if not exists subjects (
  id uuid primary key default uuid_generate_v4(),
  subject_code text unique,
  subject_name text not null,
  grade_level text,
  default_credit numeric default 1,
  created_at timestamptz default now()
);

create table if not exists academic_records (
  id uuid primary key default uuid_generate_v4(),
  student_id uuid references students(id) on delete cascade not null,
  subject_id uuid references subjects(id) on delete set null,
  subject_name text not null,
  grade_level text not null,
  academic_year text,
  semester_1 text,
  semester_2 text,
  credit numeric default 1,
  created_at timestamptz default now()
);

create table if not exists transcript_history (
  id uuid primary key default uuid_generate_v4(),
  student_id uuid references students(id) on delete cascade not null,
  transcript_type text not null,
  issued_at timestamptz default now(),
  issued_by text default 'Administrator'
);

alter table students enable row level security;
alter table subjects enable row level security;
alter table academic_records enable row level security;
alter table transcript_history enable row level security;

-- Demo policies. Replace with authenticated policies before production.
create policy "demo students all" on students for all using (true) with check (true);
create policy "demo subjects all" on subjects for all using (true) with check (true);
create policy "demo records all" on academic_records for all using (true) with check (true);
create policy "demo history all" on transcript_history for all using (true) with check (true);
