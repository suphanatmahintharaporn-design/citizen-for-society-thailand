import 'dotenv/config';
import { readFile } from 'node:fs/promises';
import pg from 'pg';

if (!process.env.DATABASE_URL) throw new Error('DATABASE_URL is required');
const { Pool } = pg;
const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: process.env.NODE_ENV === 'production' ? { rejectUnauthorized: false } : false
});

try {
  const sql = await readFile(new URL('../../database/schema.sql', import.meta.url), 'utf8');
  await pool.query(sql);
  console.log('Database schema applied successfully.');
} finally {
  await pool.end();
}
