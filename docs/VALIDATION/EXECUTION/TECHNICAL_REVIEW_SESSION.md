# MedTrace AI — Technical & Security Review Protocol

## Protocol Specifications
- **Target Audience:** Health IT Security Architects, Senior Backend/AI Engineers, and Privacy Officers.
- **Session Duration:** 30–45 Minutes.
- **Review Scope:** Codebase architecture, REST APIs, database schemas, authentication, multi-tenant patient isolation, audit logging, RAG pipeline, prompt injection defense, and automated testing.

---

## Technical Audit Domains & Review Questions

### 1. System Architecture & API Design (7 Mins)
- Review `docs/ARCHITECTURE.md`, `backend/app/main.py`, and `backend/app/api/v1/`.
- *"How clean is the separation between API controllers, service logic, ORM models, and safety modules?"*
- *"What architectural bottlenecks or maintainability concerns do you observe in the FastAPI structure?"*

### 2. Multi-Tenant Patient Isolation (BOLA / IDOR Defense) (8 Mins)
- Review `backend/app/api/v1/patient.py`, `labs.py`, `medications.py`.
- *"How effectively does the zero-trust `patient.user_id == current_user.id` check protect against BOLA/IDOR vulnerability risks?"*
- *"What additional database-level Row-Level Security (RLS) policies would you require before multi-tenant production?"*

### 3. Cryptographic Audit Logging (5 Mins)
- Review `backend/app/security/audit.py` (`AuditLogger`).
- *"Reviewing the SHA-256 payload hash generation (`user_id:action:resource:ip:timestamp`), how robust is this event tracking?"*
- *"What improvements would you recommend for cryptographic audit log integrity?"*

### 4. RAG Vector Retrieval & Evidence Mapping (8 Mins)
- Review `backend/app/rag/pipeline.py` & `backend/app/ai/context_builder.py`.
- *"How sound is the hybrid vector + sparse keyword retrieval and deterministic XML context assembly (`<patient_context>`)?"*
- *"How effectively does the citation engine map output claims back to vector store metadata URIs?"*

### 5. Prompt Injection Defense Architecture (7 Mins)
- Review `backend/app/safety/prompt_injection.py`.
- *"How robust is the combination of pattern matching regexes (`INJECTION_PATTERNS`) and XML wrapper tag isolation (`<untrusted_user_document_content>`) with tag neutralization?"*
- *"Where could an indirect prompt injection attack potentially exploit this boundary?"*

### 6. Automated Testing & Deployment Readiness (5 Mins)
- Review `tests/` directory (61 pytest automated cases across unit, integration, red-team, and evaluation).
- *"Reviewing the 100% pass rate across the 61-test suite, what additional edge cases or security tests should be added?"*
- *"What deployment risks or scalability bottlenecks exist in transitioning from SQLite fallback to production PostgreSQL + Redis workers?"*
