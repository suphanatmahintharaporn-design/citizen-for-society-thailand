CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE IF NOT EXISTS members (
 id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
 member_no TEXT UNIQUE, first_name TEXT NOT NULL, last_name TEXT NOT NULL,
 email TEXT NOT NULL UNIQUE, phone TEXT, province TEXT, interest TEXT, reason TEXT,
 status TEXT NOT NULL DEFAULT 'pending' CHECK(status IN ('pending','approved','rejected','suspended')),
 consent_privacy_at TIMESTAMPTZ, created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
 updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS members_status_idx ON members(status);
CREATE TABLE IF NOT EXISTS admin_users (
 id UUID PRIMARY KEY DEFAULT gen_random_uuid(), email TEXT NOT NULL UNIQUE,
 password_hash TEXT NOT NULL, role TEXT NOT NULL CHECK(role IN ('super_admin','content_admin','membership_admin')),
 active BOOLEAN NOT NULL DEFAULT true, created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE TABLE IF NOT EXISTS posts (
 id UUID PRIMARY KEY DEFAULT gen_random_uuid(), type TEXT NOT NULL CHECK(type IN ('news','announcement','project','event','gallery')),
 title TEXT NOT NULL, slug TEXT NOT NULL UNIQUE, summary TEXT, body TEXT, image_url TEXT,
 published BOOLEAN NOT NULL DEFAULT false, published_at TIMESTAMPTZ,
 created_by UUID REFERENCES admin_users(id) ON DELETE SET NULL,
 created_at TIMESTAMPTZ NOT NULL DEFAULT now(), updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE TABLE IF NOT EXISTS audit_logs (
 id BIGSERIAL PRIMARY KEY, actor_admin_id UUID REFERENCES admin_users(id) ON DELETE SET NULL,
 action TEXT NOT NULL, target_type TEXT NOT NULL, target_id TEXT,
 metadata JSONB NOT NULL DEFAULT '{}'::jsonb, created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
-- Never log passwords, tokens, complete form payloads, or unnecessary personal data.
