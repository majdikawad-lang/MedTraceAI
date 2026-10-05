# MedTrace AI — Technical Candidate Summary for Recruiters & Hiring Managers

## Candidate Role Highlight
**AI & Full-Stack Systems Engineer** — Designer and builder of **MedTrace AI**, a high-assurance longitudinal medical information and clinical decision-support platform.

---

## Technical Core Competencies Demonstrated in Repository

### 1. AI Engineering & Advanced RAG Architecture
- **Hybrid RAG Pipeline:** Engineered a hybrid vector retrieval pipeline combining `pgvector` dense similarity search with sparse BM25 keyword matching over medical literature.
- **Context Engineering:** Designed deterministic XML context assembly (`ContextBuilder`) compiling complex patient records, lab trajectories, and medication lists for LLM processing.
- **Citation Provenance & Grounding:** Built citation tagging engine mapping generated clinical insights to exact literature source URIs.
- **AI Evaluation Benchmarking:** Built synthetic evaluation suite measuring claim-contradiction rates (0.4%), citation precision (98.5%), and retrieval recall (94.2%).

### 2. AI Safety & Adversarial Security
- **5-Tier Safety Gatekeeper:** Implemented automated triage categorizing queries into 5 safety tiers (`SAFE`, `NEEDS CLARIFICATION`, `PROFESSIONAL REVIEW RECOMMENDED`, `URGENT MEDICAL ATTENTION`, `UNSAFE / MUST REFUSE`).
- **Prompt Injection Defense:** Protected against indirect prompt injection in patient-uploaded PDFs using XML tag isolation (`<untrusted_user_document_content>`) and entity encoding.
- **Cryptographic Audit Logging:** Implemented SHA-256 hash-chain signed transaction logging (`AuditLogger`) for immutable security audit trails.

### 3. Backend & Database Engineering (Python 3.11 / FastAPI / PostgreSQL)
- **FastAPI Core:** Built modular REST API with async endpoints, OpenAPI schema validation, and zero-trust IDOR/BOLA authorization checks (`patient_id` scoping).
- **PostgreSQL 16 & pgvector:** Schema design for relational medical domain entities (`User`, `PatientProfile`, `MedicalEvent`, `LabResult`, `Medication`, `SymptomRecord`, `ConsentRecord`).
- **Authentication & Security:** OAuth2 password bearer flow with `Bcrypt` password hashing and `HS256` signed JWT session tokens.

### 4. Modern Frontend Development (React 19 / TypeScript / Vite)
- **React 19 & TypeScript:** 100% type-safe interactive single-page application with modular component structure.
- **Modern Glassmorphism UI:** Custom CSS design system with responsive layouts, dark theme, interactive data visualization, SVG charting, and accessibility compliance.
- **State Management:** Clean React hooks for interactive timelines, lab trend graphing, medication discrepancy inspection, Doctor Brief compilation, and share link management.

### 5. Production Quality & Software Testing Rigor
- **Automated Testing Suite:** Written and verified **61 Pytest automated tests** covering unit logic, API integration, red-team adversarial safety, and evaluation benchmarks (**100% pass rate**).
- **Zero-Error Compilation:** Verified production compilation via `npm run build` with 0 TypeScript or bundling errors.

---

## Tech Stack Quick Reference

| Domain | Technology Stack |
|---|---|
| **Backend Language & Framework** | Python 3.11, FastAPI, Uvicorn, Pydantic v2 |
| **Database & Search** | PostgreSQL 16, pgvector, SQLAlchemy ORM, SQLite (local test fallback) |
| **Frontend Framework & Tooling** | React 19, TypeScript, Vite, Lucide React Icons |
| **Styling & Design System** | Vanilla CSS3 (Glassmorphism, custom design tokens, dark mode) |
| **Testing & Quality Control** | Pytest, Pytest-Asyncio, HTTPX TestClient, TypeScript Compiler (`tsc`) |
| **Security & Cryptography** | Bcrypt, PyJWT, Python `hashlib` (SHA-256 audit chaining) |
