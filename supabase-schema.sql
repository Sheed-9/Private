-- Run this in your Supabase SQL Editor to set up the database

-- CLIENTS TABLE
create table clients (
  id uuid default gen_random_uuid() primary key,
  name text not null,
  email text,
  phone text,
  company text,
  status text default 'active',
  created_at timestamp with time zone default now()
);

-- NOTES TABLE
create table notes (
  id uuid default gen_random_uuid() primary key,
  client_id uuid references clients(id) on delete cascade,
  text text not null,
  created_at timestamp with time zone default now()
);

-- LINKS TABLE
create table links (
  id uuid default gen_random_uuid() primary key,
  client_id uuid references clients(id) on delete cascade,
  label text not null,
  url text not null,
  created_at timestamp with time zone default now()
);

-- FILES TABLE (metadata only — actual files go to Supabase Storage)
create table files (
  id uuid default gen_random_uuid() primary key,
  client_id uuid references clients(id) on delete cascade,
  name text not null,
  size text,
  storage_path text not null,
  type text default 'document', -- 'document' or 'image'
  created_at timestamp with time zone default now()
);

-- STORAGE BUCKET (run this too)
insert into storage.buckets (id, name, public) values ('client-files', 'client-files', true);

-- STORAGE POLICY (allow all operations — since this is your private app)
create policy "Allow all" on storage.objects for all using (bucket_id = 'client-files') with check (bucket_id = 'client-files');

-- ROW LEVEL SECURITY (disable since you control access via app password)
alter table clients disable row level security;
alter table notes disable row level security;
alter table links disable row level security;
alter table files disable row level security;
