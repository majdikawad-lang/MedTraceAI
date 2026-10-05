# Controlled Production Deployment Plan

## 1. Production Topology
- **Next.js Frontend**: VERIFIED (Runs as standalone unprivileged container on port 3000)
- **FastAPI Backend**: VERIFIED (Runs as unprivileged container on port 8000)
- **PostgreSQL**: VERIFIED (Runs internally on private docker network)
- **Qdrant**: VERIFIED (Runs internally on private docker network)
- **Private Networking**: VERIFIED (Docker bridge network isolates DBs)
- **Reverse Proxy / Load Balancer**: EXTERNAL DEPENDENCY (Not implemented in repo, expected to be provided by Cloud Provider e.g. AWS ALB)
- **DNS**: EXTERNAL DEPENDENCY
- **TLS**: EXTERNAL DEPENDENCY (Terminated at the Load Balancer)
- **Persistent Storage**: VERIFIED (Docker volumes `postgres_data`, `qdrant_data`, requires cloud volume backing in prod)
- **Backup Storage**: NOT IMPLEMENTED (Requires off-site object storage like S3)
- **Secrets Management**: EXTERNAL DEPENDENCY (Expected AWS Secrets Manager, currently injected via `.env`)
- **Monitoring/Logging**: PARTIAL (Structured JSON logging output to stdout, requires external daemon like FluentBit/Datadog to ingest)

## 2. Production Configuration
The application rejects insecure defaults upon startup.
- `ENVIRONMENT=production`
- `DEBUG=False`
- `SECRET_KEY` must be manually injected and high entropy.
- `DATABASE_URL` must point to a legitimate PostgreSQL instance.
- `QDRANT_URL` must point to Qdrant.
- `LLM_API_KEY` must be provided.
- `CORS_ORIGINS` must explicitly match the frontend URL without wildcards.

## 3. Database Deployment
### Initial Deployment & Migrations
1. Spin up PostgreSQL.
2. Spin up FastAPI backend with `DATABASE_URL` configured.
3. The backend container initializes and runs `alembic upgrade head` at startup (or via dedicated migration job).
4. Verify migration success.
5. Bring up frontend.

## 4. Qdrant Deployment
- **Initialization:** Collections (`clinical_notes`) are lazily initialized upon the first vector insertion if they do not exist.
- **Isolation:** Explicit payloads (`tenant_id`, `patient_id`) must accompany all vectors. Missing metadata defaults safely to `None` which fails-closed against explicit tenant/patient search filters. Global vectors contain `is_global=True`.

## 5. Secrets Management
Production deployments must inject the following secrets via environment variables from a secure vault (e.g. AWS Secrets Manager):
- `POSTGRES_USER`
- `POSTGRES_PASSWORD`
- `DATABASE_URL`
- `SECRET_KEY` (Auth signing key)
- `LLM_API_KEY`

## 6. TLS & HTTP Security
- The containers expose raw HTTP on ports 3000 and 8000.
- Production **requires** an external load balancer to terminate TLS (`https://`), set `Strict-Transport-Security`, handle WAF/rate limiting, and securely route traffic.

## 7. Observability
- All API requests are tracked via `X-Request-ID` and logged using structured JSON.
- `GET /api/v1/health/liveness` and `GET /api/v1/health/readiness` are exposed for orchestrator probes.
- Logs NEVER include raw medical notes, LLM responses, or prompts. Only identifiers and action summaries (e.g., `ACTION_CREATE_SYMPTOM`) are recorded.

## 8. Backup / Disaster Recovery
- **PostgreSQL**: Trigger `pg_dump -F c` via cron job. Retention/RPO: NOT YET DEFINED. 
- **Qdrant**: Trigger `/collections/{name}/snapshots` via cron job. Retention/RPO: NOT YET DEFINED.

## 9. Rollback Plan
- **Application Failure:** Revert container image tag to previous known-good version.
- **Migration Failure / DB Rollback:** Ensure a DB backup is taken *before* migrations. To rollback schema, restore the database backup. Downgrading via `alembic downgrade -1` destroys data and should NOT be used in production.

## 10. Production Smoke Tests
After deployment, verify health:
1. Curl `/api/v1/health/readiness`
2. Create synthetic Tenant and Patient.
3. Verify cross-tenant isolation (Tenant B HTTP 404 on Patient A).
4. Ingest synthetic clinical note and verify retrieval.
5. Verify audit events log successfully.
6. Clean up synthetic data.

## 11. Pre-Go-Live Checklist
- [ ] Provision Cloud Infrastructure (ALB, ECS/EKS).
- [ ] Configure TLS Certificate.
- [ ] Inject Production Secrets.
- [ ] Configure Log Aggregator (FluentBit -> CloudWatch/Datadog).
- [ ] Test End-to-End AI Success Path with Production LLM.

---
## Staging Execution Evidence
*Status: BLOCKED*
*Date: 2026-10-02*
The infrastructure-as-code has passed static and parser validations. However, dynamic staging provisioning is explicitly blocked pending integration with a safe, non-production AWS Account. No production resources may be provisioned until the staging deployment is fully executed and verified. See docs/AWS_STAGING_DEPLOYMENT_VERIFICATION.md for exact prerequisites.
