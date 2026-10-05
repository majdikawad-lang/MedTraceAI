# Production Security & Release Checklist

## Authentication
- [x] Passwords hashed (bcrypt) and never logged
- [x] JWT expires, default secrets rejected in production
- [x] Errors sanitized (no enumeration via 401 detail)

## Authorization & Tenant Isolation
- [x] Tenancy context strictly decoupled from HTTP request body (derived exclusively from validated JWT via `get_current_user`)
- [x] No `tenant_id` present in Pydantic create/update schemas (Zero mass assignment IDOR surface)

## PatientAccess & IDOR Protection
- [x] Patient scoped endpoints implicitly validate both `tenant_id` and `patient_id` simultaneously
- [x] `require_patient_read` and `require_patient_write` explicitly enforce Tenant boundaries and `STAFF` revocation constraints

## API Errors
- [x] Standardized `{"error": {"code": ..., "message": ...}}` envelope
- [x] Internal Python Exceptions caught and obfuscated from HTTP output (no traceback leakage)

## Audit Trail & PHI Logging
- [x] `AuditService` log function enforces rigid schemas preventing arbitrary dicts or `**kwargs`
- [x] `print` statements scrubbed from API layer
- [x] `db.commit()` architecturally orchestrates transaction finality to align mutation success with audit success

## AI & Vector Isolation
- [x] Hardcoded `must=[FieldCondition(key="tenant_id",...)]` filters confirmed in Qdrant repository layer
- [x] HTTP layer drops unauthorized invocations before hitting expensive Vector queries

## Secrets & Docker Infrastructure
- [x] Containers running as UID 1000 or unprivileged roles
- [x] DB ports and Qdrant ports (5432, 6333) remain isolated inside `medtrace_network`, inaccessible directly from Host
- [x] No production hardcoded secrets committed to configuration files
- [x] Graceful shutdown handling configured (30s stop period) to protect API transactions

## Backup & Disaster Recovery
- [x] `pg_dump` and Qdrant Snapshot verified in isolated ephemeral destruction test
- [x] Playbooks tested and merged

**Final Verification:**
68 automated integration/security tests executed. `VERIFIED` Status achieved.
