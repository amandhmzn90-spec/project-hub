# HubCraft — Personal Projects & Productivity Hub (Wide Desktop)

Dashboard kanban & bento-canvas interaktif untuk mengelola personal project, script konsol otomasi browser, visual board, dan catatan inspirasi di layar desktop / ultra-wide monitor.

---

## ⚡ Fitur Utama

- **Bento Grid Canvas Responsif**: Card dengan ukuran dinamis (`1x`, `2x`, `3x`, `4x full width`).
- **Drag & Drop Reordering**: Susun letak kartu dengan handle grip (`⠿`) atau tombol geser (`◀`, `▶`).
- **Project & Tool Registry**: Tabel ringkasan project lengkap dengan status, working version, lokasi file/akun, link, dan ide backlog.
- **JavaScript Console Vault**: Simpan dan salin snippet JavaScript automation untuk konsol browser langsung dengan 1 klik.
- **Supabase Cloud Sync (PostgreSQL)**: Sinkronisasi data realtime multi-device dengan fallback offline otomatis ke `localStorage`.
- **Export & Import Backup (JSON)**: Cadangkan dan pulihkan data kapan saja tanpa login.

---

## 🚀 Setup Supabase Cloud (Hanya 1x)

Project ini telah dikonfigurasi dengan Supabase project URL & public anon key:
- **Project URL**: `https://gpggngnnuwirtbqgebhd.supabase.co`

### Langkah Menyiapkan Tabel di Supabase:
1. Buka [Supabase Dashboard SQL Editor](https://supabase.com/dashboard/project/gpggngnnuwirtbqgebhd/sql/new).
2. Buka file [`supabase_schema.sql`](file:///supabase_schema.sql) di repository ini (atau klik tombol **Cloud Sync** > **Copy SQL** di website).
3. Paste seluruh skrip SQL ke SQL Editor Supabase, lalu klik tombol **Run**.
4. Selesai! Website akan otomatis mendeteksi tabel `projects`, `widgets`, dan `hubcraft_meta`, lalu melakukan sinkronisasi data cloud secara otomatis.

---

## 🌐 Cara Deploy Website (Gratis)

### Opsi 1: GitHub Pages (Otomatis)
Project ini sudah dilengkapi GitHub Actions workflow [`.github/workflows/deploy.yml`](file:///.github/workflows/deploy.yml).
1. Masuk ke repository GitHub kamu: `https://github.com/amandhmzn90-spec/project-hub`
2. Buka tab **Settings** > **Pages**
3. Pada bagian **Build and deployment** > **Source**, pilih **GitHub Actions**
4. Setiap kali kamu melakukan `git push origin main`, website akan otomatis ter-deploy dan live!

### Opsi 2: Vercel
1. Buka [vercel.com](https://vercel.com) dan login dengan akun GitHub.
2. Klik **Add New Project** dan import repository `project-hub`.
3. Vercel akan otomatis mengenali [`vercel.json`](file:///vercel.json) dan meng-hosting `index.html`.
4. Klik **Deploy**.
