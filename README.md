# ACIS Transcript System

## Quick start
1. Upload all files in this folder to your GitHub repository.
2. In `config.js`, paste your Supabase Project URL and anon key.
3. Run `supabase_schema.sql` in Supabase SQL Editor.
4. Import the GitHub repository into Vercel.
5. Deploy.

## Demo login
- Username: `admin`
- Password: `admin`

> Change this before real production use.

## Main features
- Students: Add, edit, delete, search, CSV import/export
- Subjects: Add, edit, delete, CSV import/export
- Academic records: Add, edit, delete
- Transcript generation and browser Print / Save as PDF
- Date display: Month DD, YYYY
- Title instead of gender: Mr., Miss, Mrs., Ms.
- Optional graduation date; incomplete transcript displays `---------`
- Supabase-ready database schema

## Supabase configuration
Open `config.js` and replace:
- `YOUR_SUPABASE_URL`
- `YOUR_SUPABASE_ANON_KEY`

The app automatically uses local demo storage if Supabase is not configured.
