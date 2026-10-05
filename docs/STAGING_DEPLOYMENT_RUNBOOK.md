# Staging Deployment Runbook

## Overview
This runbook describes the procedure to deploy MedTrace AI to a production-like staging environment. It relies on Docker Compose to orchestrate unprivileged containers for the Next.js Frontend, FastAPI Backend, PostgreSQL database, and Qdrant vector store.

## Prerequisites
- Docker & Docker Compose installed.
- A disposable staging host (or local development environment).
- At least 4GB of RAM and 10GB of storage.

## Environment Variables
The application expects the following variables to be set (either in the host environment or a `.env` file in the root):
```env
# Example .env file
ENVIRONMENT=production
DEBUG=False
POSTGRES_USER=medtrace_admin
POSTGRES_PASSWORD=strong_staging_password
POSTGRES_DB=medtrace_staging
```

## Startup Sequence
1. Navigate to the `infrastructure` directory.
2. Build and start the container stack in detached mode:
   ```bash
   docker-compose up -d --build
   ```
3. Docker Compose will start the services in the correct order (Postgres & Qdrant -> Backend -> Frontend).

## Migration Sequence
Once the backend container is running, execute the Alembic migrations to construct the database schema:
```bash
docker exec medtrace_backend alembic upgrade head
```

## Health Verification
Verify the backend is healthy by invoking the unauthenticated liveness and readiness endpoints:
```bash
curl -s http://localhost:8000/api/v1/health/liveness
# Expected: {"status": "ok"}

curl -s http://localhost:8000/api/v1/health/readiness
# Expected: {"status": "ready"}
```

## Smoke Testing
Execute the automated staging operational readiness suite against the live instance:
```bash
# Ensure STAGING_BASE_URL points to the correct location
export STAGING_BASE_URL="http://localhost:8000/api/v1"
pytest backend/tests/test_p3p_staging_operational_readiness.py -v
```

## Backup Procedure
1. Create a logical dump of the PostgreSQL database:
   ```bash
   docker exec medtrace_postgres pg_dump -U medtrace_admin -d medtrace_staging -F c > backup_staging.dump
   ```
2. Snapshot the Qdrant instance via its HTTP API:
   ```bash
   curl -X POST http://localhost:6333/collections/clinical_notes/snapshots
   ```

## Restore Procedure
1. Terminate the application backend to avoid mid-restore mutations.
2. Drop the existing database and recreate it.
3. Use `pg_restore`:
   ```bash
   cat backup_staging.dump | docker exec -i medtrace_postgres pg_restore -U medtrace_admin -d medtrace_staging --clean
   ```
4. Restore Qdrant snapshots via the API.
5. Restart the backend container.

## Rollback Procedure
If a deployment fails, execute a rollback using the procedures outlined in `docs/ROLLBACK_RUNBOOK.md`.

## Shutdown Procedure
To cleanly shutdown the environment (allowing 30s for the backend to finalize transactions):
```bash
docker-compose down
```
To also destroy the staging data volumes:
```bash
docker-compose down -v
```

## Troubleshooting Guidance
- **Backend fails to start**: Inspect logs `docker logs medtrace_backend`. Ensure `POSTGRES_PASSWORD` matches the database container.
- **503 AI Errors**: The AI engine is not configured with an LLM provider. This is expected in staging unless explicit AI credentials are injected.
