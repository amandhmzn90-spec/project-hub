-- ==============================================================================
-- HUBCRAFT - SUPABASE POSTGRESQL SCHEMA & PERMISSIONS
-- ==============================================================================
-- Jalankan skrip SQL ini di Supabase Dashboard -> SQL Editor -> New Query -> Run
-- ==============================================================================

-- 1. TABEL: PROJECTS (Menyimpan daftar project & automation script)
CREATE TABLE IF NOT EXISTS public.projects (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  category TEXT DEFAULT 'work',
  description TEXT,
  working_version TEXT,
  location TEXT,
  link TEXT,
  status TEXT DEFAULT 'in_use',
  cover_image TEXT,
  script TEXT,
  improvement_ideas TEXT,
  col_span INTEGER DEFAULT 1,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- 2. TABEL: WIDGETS (Menyimpan kartu board visual / photo & inspirational quotes)
CREATE TABLE IF NOT EXISTS public.widgets (
  id TEXT PRIMARY KEY,
  type TEXT NOT NULL,
  col_span INTEGER DEFAULT 1,
  image_url TEXT,
  caption TEXT,
  click_url TEXT,
  text TEXT,
  author TEXT,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- 3. TABEL: HUBCRAFT_META (Menyimpan konfigurasi urutan kartu kanban/bento board)
CREATE TABLE IF NOT EXISTS public.hubcraft_meta (
  key TEXT PRIMARY KEY,
  value JSONB,
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- ==============================================================================
-- ROW LEVEL SECURITY (RLS) & PUBLIC ACCESS POLICIES
-- Mengizinkan public anon key untuk membaca dan menyimpan data
-- ==============================================================================

ALTER TABLE public.projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.widgets ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.hubcraft_meta ENABLE ROW LEVEL SECURITY;

-- Drop existing policies if any to prevent duplicate conflict
DO $$
BEGIN
  DROP POLICY IF EXISTS "Allow anon all on projects" ON public.projects;
  DROP POLICY IF EXISTS "Allow anon all on widgets" ON public.widgets;
  DROP POLICY IF EXISTS "Allow anon all on hubcraft_meta" ON public.hubcraft_meta;
END $$;

-- Policy untuk projects
CREATE POLICY "Allow anon all on projects"
  ON public.projects
  FOR ALL
  TO anon
  USING (true)
  WITH CHECK (true);

-- Policy untuk widgets
CREATE POLICY "Allow anon all on widgets"
  ON public.widgets
  FOR ALL
  TO anon
  USING (true)
  WITH CHECK (true);

-- Policy untuk meta
CREATE POLICY "Allow anon all on hubcraft_meta"
  ON public.hubcraft_meta
  FOR ALL
  TO anon
  USING (true)
  WITH CHECK (true);

-- ==============================================================================
-- REALTIME REPLICATION (Agar sinkronisasi antar device / tab berjalan otomatis)
-- ==============================================================================
DO $$
BEGIN
  BEGIN
    ALTER PUBLICATION supabase_realtime ADD TABLE public.projects;
  EXCEPTION WHEN duplicate_object THEN
    -- Table already in publication
  END;
  
  BEGIN
    ALTER PUBLICATION supabase_realtime ADD TABLE public.widgets;
  EXCEPTION WHEN duplicate_object THEN
    -- Table already in publication
  END;

  BEGIN
    ALTER PUBLICATION supabase_realtime ADD TABLE public.hubcraft_meta;
  EXCEPTION WHEN duplicate_object THEN
    -- Table already in publication
  END;
END $$;
