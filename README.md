# 🗄️ ClientVault

Your private client management hub. Store notes, documents, images, and links for every client — password protected, permanently stored.

---

## 🚀 Deploy in 4 Steps

### Step 1 — Set up Supabase (free database + file storage)

1. Go to [supabase.com](https://supabase.com) and create a free account
2. Click **"New Project"** — give it a name (e.g. "clientvault")
3. Once created, go to **SQL Editor** (left sidebar)
4. Paste the entire contents of `supabase-schema.sql` and click **Run**
5. Go to **Settings → API** and copy:
   - `Project URL`
   - `anon public` key

---

### Step 2 — Set up your environment

1. Copy the example env file:
   ```
   cp .env.example .env.local
   ```
2. Open `.env.local` and fill in:
   ```
   VITE_SUPABASE_URL=https://your-project.supabase.co
   VITE_SUPABASE_ANON_KEY=your-anon-key-here
   VITE_APP_PASSWORD=your_secret_password
   ```
   > ⚠️ Change `VITE_APP_PASSWORD` to something strong — this is what protects your app!

---

### Step 3 — Push to GitHub

1. Create a new **private** repo on [github.com](https://github.com)
2. In this folder, run:
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/YOUR_USERNAME/clientvault.git
   git push -u origin main
   ```

---

### Step 4 — Deploy on Vercel (free hosting)

1. Go to [vercel.com](https://vercel.com) and sign in with GitHub
2. Click **"Add New Project"** → import your `clientvault` repo
3. Before deploying, click **"Environment Variables"** and add:
   - `VITE_SUPABASE_URL` → your Supabase project URL
   - `VITE_SUPABASE_ANON_KEY` → your Supabase anon key
   - `VITE_APP_PASSWORD` → your chosen password
4. Click **Deploy** — done! 🎉

Your app will be live at `https://clientvault-xxx.vercel.app`

---

## 💻 Run locally (optional)

```bash
npm install
npm run dev
```
Then open `http://localhost:5173`

---

## 🔐 Security Notes

- Keep your GitHub repo **private** so your `.env.local` is safe
- Never share your Supabase anon key publicly
- Your password is set via the `VITE_APP_PASSWORD` environment variable — change it anytime in Vercel settings

---

## ✨ Features

- 🔒 Password-protected login
- 👤 Client profiles (name, email, phone, company, status)
- 📝 Notes with timestamps
- 🔗 Saved links with labels
- 📁 Document uploads (PDF, Word, Excel, PowerPoint, CSV)
- 🖼️ Image uploads with gallery view
- 🔍 Search across all clients
- 💾 All data permanently stored in Supabase
