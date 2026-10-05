# MedTrace AI - Deep Architecture Audit

## A. Executive Summary
An exhaustive architectural audit of the MedTrace AI repository reveals that the codebase is in an early MVP state characterized by severe architectural drift, critical security vulnerabilities, and significant divergence from documented specifications. While the foundational domain model (PostgreSQL, FastAPI, Next.js) is solid, the repository suffers from unregistered API routes, unauthenticated AI endpoints, a strictly B2C data access pattern that blocks B2B SaaS adoption, and "mocked" AI dependencies that result in runtime crashes. Immediate P0 remediation is required before any new product features are built.

## B. Current Architecture Diagram
```text
User / Physician
      │
      ▼
 Next.js Frontend (frontend/)  <-- Active UI (Vite in src/ is dead code)
      │
      ▼
 FastAPI Backend (backend/)
      ├── main.py (Missing core routers!)
      ├── /api/v1 (auth, ai_engine) <-- ai_engine lacks auth!
      ├── /services (implemented but partially disconnected)
      └── /rag (Qdrant vector store)
      │
      ├──► PostgreSQL (Relational Data & Auth)
      └──► Qdrant (Vector Embeddings)
```

## C. Frontend Architecture Findings
- **Discovery**: The repository contains two distinct frontend applications: a Vite/React app at the root (`/src`, `package.json`, `vite.config.ts`) and a Next.js app in `/frontend`.
- **Active System**: `infrastructure/docker-compose.yml` mounts and builds `../frontend`.
- **Finding**: The `/frontend` Next.js application is the active product UI. The root `/src` directory is dead code/legacy implementation and should be safely removed to prevent confusion.

## D. Backend Architecture Findings
- **Missing API Registrations**: The `backend/app/api/v1/` directory contains fully implemented routers for `patient.py`, `safety.py`, `symptoms.py`, `timeline.py`, `labs.py`, and `medications.py`.
- **Finding**: `backend/app/main.py` directly imports and mounts `auth` and `ai_engine`, completely bypassing `router.py`. As a result, **all clinical API endpoints are unregistered and inaccessible at runtime.**

## E. API Drift Findings
- **Drift**: The frontend dashboard actively calls `/api/v1/ai/analyze`, but clinical data pages cannot function because their backend counterparts (`/api/v1/patient/*`, `/api/v1/labs/*`) are not registered in the FastAPI app.

## F. Authentication & Authorization Findings
- **Critical Vulnerability (IDOR / Unauthenticated Access)**: The `POST /api/v1/ai/analyze` endpoint in `ai_engine.py` does not include the `Depends(get_current_user)` or `TenantContext` dependency. It is fully exposed to unauthenticated internet traffic.
- **Data Leakage**: The same endpoint accepts a raw `patient_id` from the client without verifying if the authenticated user (which it doesn't check) has authorization to view that patient.

## G. Multi-tenancy Findings
- **Data Model**: The database schema includes `Tenant` and `TenantMembership`, suggesting B2B SaaS readiness.
- **Implementation Reality**: `AuthService.register_user` hardcodes a strictly B2C model (1 User = 1 Tenant = 1 PatientProfile).
- **Access Pattern**: All clinical routes (e.g., `labs.py`) enforce access by querying `patient_repo.get_by_user_id(tenant_context.user_id)`. There is no mechanism to query a different patient ID.
- **SaaS Gap**: The current model makes it impossible for a clinic/doctor to manage multiple patients under a single tenant.

## H. AI Runtime Findings
- **Runtime Blocker**: In `api/v1/ai_engine.py`, the dependency injection functions (`get_clinical_engine`, `get_medication_safety_gate`) instantiate the AI engines passing `None` for all critical dependencies (`context_builder=None`, `vector_store=None`, `llm_client=None`).
- **Impact**: Any valid request to `/api/v1/ai/analyze` will result in an immediate `AttributeError` crashing the endpoint (HTTP 500) when the engine attempts to invoke `self.context_builder.get_patient_timeline()`.

## I. Security Findings
- **Exposed Infrastructure**: `docker-compose.yml` binds internal PostgreSQL (`5432:5432`) and Qdrant (`6333:6333`) ports directly to the host machine.
- **Insecure Defaults**: Hardcoded secrets (`securepassword123`, `default_dev_secret_key...`) and `DEBUG = True` are present in configuration files.
- **Container Privileges**: Both backend and frontend Dockerfiles execute their respective services as the `root` user rather than defining a least-privilege `nonroot` user.

## J. Audit / Consent / Sharing Findings
- **Audit Logs**: `AuditLogger` generates a SHA-256 hash of the individual log payload. It does **not** include the hash of the previous log entry, meaning it is a per-record hash, not a cryptographically immutable hash chain.
- **Sharing**: The documented "Time-Bounded Sharing" and share token revocation functionality is completely missing from the codebase.

## K. SaaS Readiness Findings
- **Gaps**: There are zero implementations for subscriptions, tiered plans, billing integrations, usage metering, quotas, or user invitations. Multi-tenant administration is missing.

## L. Testing Findings
- **Broken Test Suite**: Running `pytest` results in a fatal collection error: `ModuleNotFoundError: No module named 'app'`. The tests lack a proper `__init__.py` structure or `PYTHONPATH` configuration to resolve backend modules.
- **Coverage**: The test suite only contains unit tests for safety gates. There are zero API integration tests or authentication tests.

## M. Documentation Drift
- **README Contradictions**: The README claims 100% test passing (they crash), Vite/React (it uses Next.js), pgvector (it uses Qdrant), zero-trust IDOR protection (AI endpoint is unauthenticated), and hash-chain logging (it's per-record). The README is highly aspirational and diverges significantly from the repository truth.

## N. Production Readiness
- **Missing Elements**: The repository lacks production CI/CD pipelines, automated database backup strategies, secrets management (e.g., Vault, AWS Secrets), and robust health-check auto-healing capabilities.

## O. Prioritized Remediation Plan

| Priority | Component | File | Problem | Recommended Fix |
| :--- | :--- | :--- | :--- | :--- |
| **P0** | API | `backend/app/main.py` | Clinical routers are unregistered. | Import `api_v1_router` from `router.py` instead of mounting isolated routers. |
| **P0** | Auth & AI | `backend/app/api/v1/ai_engine.py` | Endpoint is unauthenticated and vulnerable to IDOR. | Inject `Depends(require_permission(...))` and validate `patient_id` against `tenant_context`. |
| **P0** | AI | `backend/app/api/v1/ai_engine.py` | Engine instantiated with `None` dependencies. | Wire up actual implementations (e.g., `ContextBuilder`, `QdrantStore`) in FastAPI dependencies. |
| **P1** | SaaS | `backend/app/services/auth_service.py` | Hardcoded B2C 1-to-1 data model blocks clinics. | Refactor registration to support organization/clinic creation and patient invitation/addition flows. |
| **P1** | Security | `docker-compose.yml`, `config.py` | Exposed DB ports and default secrets. | Remove host port bindings for DBs; enforce `.env` secrets; disable `DEBUG` in prod. |
| **P1** | Security | `Dockerfile` (both) | Services run as `root`. | Create and assign a `nonroot` user. |
| **P2** | Tests | `backend/tests/` | Pytest collection fails. | Configure `pytest.ini` with `pythonpath = .` and expand API test coverage. |
| **P2** | Audit | `backend/app/security/audit.py` | Per-record hash instead of a true chain. | Include the `previous_hash` in the cryptographic payload. |
| **P3** | SaaS | New Components | Missing billing, quotas, sharing. | Implement Stripe integration and token-based sharing logic. |

## Recommended Implementation Order
1. **Phase 1: Foundation & Security (P0)**: Register all missing FastAPI routers (`main.py`) and secure the `/analyze` endpoint with proper TenantContext authorization to close the IDOR vulnerability.
2. **Phase 2: AI Runtime Repair (P0)**: Instantiate and wire the actual `ContextBuilder`, `Qdrant` vector store, and LLM clients into `ai_engine.py` dependency injection so the AI engine actually functions at runtime.
3. **Phase 3: B2B Multi-Tenancy Architecture (P1)**: Refactor `auth_service.py` and repository layers to allow a single Clinic Tenant to own and access multiple `PatientProfile` records, enabling true B2B SaaS usage.
4. **Phase 4: Production Infrastructure (P1/P2)**: Fix Dockerfile permissions (nonroot), remove exposed database ports, fix `pytest` imports, and write integration tests.
5. **Phase 5: Advanced SaaS Features (P3)**: Build missing patient sharing modules, cryptographic hash chains, and billing/quota engines.

## Phase 2 Implementation Status (Completed)

The P0 Core Architecture & Security Repair phase has been fully completed.
- The legacy Vite application (`/src`) was successfully audited as dead code and permanently removed.
- All core FastAPI routers (e.g., patient, safety, timeline, labs) are now properly registered and accessible at runtime.
- The AI Reasoning Engine endpoint (`/api/v1/ai/analyze`) was secured against IDOR by enforcing `TenantContext` verification, preventing cross-tenant data access.
- Critical AI dependencies (`ContextBuilder`, `MedicalVectorStore`) are now correctly instantiated. Missing external components gracefully fail with HTTP 503 rather than causing application crashes.
- A `check_production_safety` validator now prevents the backend from booting in production with default secrets or debug mode enabled.
- The Pytest environment was repaired (via `PYTHONPATH` fixes), and security enforcement is now verified by an automated test suite (`backend/tests/test_p0_security.py`).
- Frontend Next.js build is passing cleanly.
