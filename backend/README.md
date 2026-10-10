# CST Membership API

## Local development
1. Install Node.js 20+ and PostgreSQL 16+.
2. Copy the root `.env.example` to `.env`; set a real database URL and a long random secret.
3. Create the database and run `psql "$DATABASE_URL" -f database/schema.sql` from the repository root.
4. Run `cd backend && npm install && npm run dev`.
5. Check `GET /api/health`.

## Implemented
- Health endpoint
- Validated membership-interest submission to PostgreSQL
- Parameterized SQL queries
- Helmet headers, JSON size limit, CORS origin restriction, API rate limiting

## Not ready for production
Member lookup and admin endpoints deliberately return 501. Authentication, email verification, secure admin sessions, role enforcement, account recovery, audit event integration, CSRF protection where cookie sessions are used, email delivery, retention/deletion workflows, and automated security tests are not implemented. Do not collect real membership data until these controls and the organization's PDPA/privacy notice are reviewed and tested. Configure TLS at the hosting layer and keep database credentials out of source control.
