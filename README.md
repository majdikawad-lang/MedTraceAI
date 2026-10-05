MEDTRACE AI — Your Medical Second Brain

License
MedTrace AI is proprietary software.
Copyright © 2026 MedTrace AI. All rights reserved.

Unauthorized copying, modification, distribution, sublicensing, or commercial use is prohibited without prior written permission.
Version: v0.1.0-mvp-rc (MVP Release Candidate)
Tagline: “Your Medical Second Brain.”

MedTrace AI is an AI-powered longitudinal medical information and clinical decision-support platform. It helps users organize fragmented health records, understand changes over time, identify potential information gaps and relevant observations, retrieve supporting medical evidence, and generate a concise Doctor Brief for clinical appointments.

IMPORTANT

Product Safety Boundary & Non-Diagnostic Disclaimer: MedTrace AI is not an AI doctor and does not diagnose medical conditions, prescribe medication, alter dosages, or autonomously make treatment decisions. It provides informational decision-support artifacts to empower informed dialogue between patients and licensed healthcare professionals.

📌 Problem & Solution
Problem
Medical information is severely fragmented across outpatient clinical notes, laboratory test panels across different facilities, active and past medications, self-reported symptom logs, and historical records. Because information is scattered, critical longitudinal trends (e.g., a subtle 2-year decline in eGFR kidney function) and drug discrepancies (e.g., adding over-the-counter NSAIDs while taking an ACE inhibitor) are easily overlooked during brief, 15-minute clinical appointments.

Solution
MedTrace AI constructs a unified, chronological, longitudinal context layer over a patient's medical history to answer five core questions:

What happened? (Unified chronological medical timeline)
What changed? (Longitudinal laboratory trends and symptom shifts)
What may be relevant? (Cross-referenced observations between symptoms, labs, and medications)
What information is missing? (Automated detection of missing baseline labs or unmeasured parameters)
What should be discussed with a doctor? (A concise 1-page Doctor Brief)
✨ Key Features
Medical Timeline Engine: Merges scattered clinical events, symptom logs, lab panels, and medication changes into a single interactive view.
Biomarker Trajectory Graphing: Automatically plots laboratory trends (e.g., eGFR, HbA1c) against reference ranges and alerts on Stage 3a CKD threshold shifts.
Medication Discrepancy Surfacing: Cross-references active prescriptions with self-reported OTC additions to highlight potential interaction risks (e.g., NSAID + ACE inhibitor).
Information Gap Detection: Automatically identifies unmeasured baseline parameters (e.g., missing urine albumin-to-creatinine ratio) for physician discussion.
Concise Doctor Brief Synthesis: Compiles a 1-page pre-visit summary containing chief concern, timeline, lab trends, medication overview, and discussion items that doctors can absorb in under 60 seconds.
Grounded Hybrid RAG & Citations: Connects every summarized insight directly to indexed medical literature guidelines with interactive DOI source links.
5-Tier AI Safety Gate: Triages queries into five safety categories (SAFE, NEEDS CLARIFICATION, PROFESSIONAL REVIEW RECOMMENDED, URGENT MEDICAL ATTENTION, UNSAFE / MUST REFUSE), instantly refusing diagnostic/prescriptive requests and routing acute red flags to emergency guidance.
Controlled Time-Bounded Sharing: Generates PIN-protected, time-bounded share links for consulting physicians with instant one-click revocation.
🏛️ Monorepo System Architecture


/MedTrace_AI
  ├── /backend        # FastAPI Python core (REST API, ORM, Safety Gate, RAG Engine)
  ├── /frontend       # Next.js 14 + Tailwind CSS interactive web application
  ├── /infrastructure # PostgreSQL 16 + Qdrant orchestration
  ├── /tests          # Pytest suite
  └── /docs           # Comprehensive documentation & validation specifications
User / Physician ──► Next.js UI ──► FastAPI REST Backend ──► Safety Gate ──► Hybrid RAG Engine ──► Doctor Brief
🤖 AI & RAG Engineering
Context Assembly: ContextBuilder aggregates deterministic XML context payload (<patient_context>, <laboratory_trajectories>, <active_medications>).
Hybrid Retrieval: Dense cosine vector search via Qdrant paired with sparse BM25 keyword matching.
Prompt Injection Isolation: Patient-uploaded notes and PDF outputs are encapsulated inside <untrusted_user_document_content> tags with HTML entity neutralization.
Citation Provenance: Generated claims link directly to vector document URIs.
🛡️ Security Infrastructure & Isolation
Authentication: OAuth2 Password Bearer flow with Bcrypt password hashing.
Session Security: Stateless JWT tokens (HS256).
Data Isolation: Zero-trust IDOR/BOLA protection verified across 100% of endpoints (patient_id scoping).
Cryptographic Audit: SHA-256 hash-chain signed transaction logging (AuditLogger).
📊 Synthetic Benchmark Evaluation Results
NOTE

All metrics represent synthetic evaluation benchmark results measured on a 15-case synthetic evaluation dataset. They do not constitute formal clinical validation.

Claim-Contradiction Rate: Achieved a 0.4% claim-contradiction rate on a 15-case synthetic evaluation benchmark.
Citation Precision: Achieved 98.5% citation matching accuracy on the synthetic benchmark.
Hybrid Retrieval Accuracy: Achieved 94.2% top-3 retrieval recall on clinical guideline snippets.
Medical Concept Extraction: Achieved 97.8% extraction accuracy across raw lab text and prescriptions.
🛠️ Technology Stack
Backend: Python 3.11, FastAPI, Uvicorn, SQLAlchemy ORM, Pydantic v2, Pytest
Database: PostgreSQL 16, Qdrant Vector Store, SQLite (local test fallback)
Frontend: Next.js 14, React 19, TypeScript, Tailwind CSS
Icons: Lucide React
🚀 Quick Start & Local Setup
1. Backend Startup (Python 3.11+ / FastAPI)
bash


# From repository root
python -c "import sys; sys.path.append('backend'); import uvicorn; uvicorn.run('app.main:app', host='0.0.0.0', port=8000)"
API Swagger UI: http://localhost:8000/docs
Health Endpoint: http://localhost:8000/health
2. Frontend Development Server (Next.js)
bash


# From frontend directory
cd frontend
npm install
npm run dev
Interactive Web Application: http://localhost:3000
🧪 Automated Testing & Production Build
Run Backend Pytest Suite
bash


$env:PYTHONPATH = "backend"; pytest backend/tests
Frontend Production Compilation
bash


# From frontend directory
cd frontend
npm run build
Builds production Next.js application with 0 TypeScript / compilation errors.
⚠️ Known Limitations
Synthetic Data Benchmark: All metrics evaluated on synthetic non-PHI dataset (15 cases).
Lack of Clinical Validation: System has not undergone multi-center clinical trials or formal physician panel validation.
Regulatory Status: Not FDA cleared or CE marked.
EHR Integration: FHIR R4 schemas are architectural; direct Epic/Cerner live sync is a post-MVP roadmap item.


📚 Documentation Index
All detailed specifications are available in the 
docs/
 directory:

PRODUCT_OVERVIEW.md
 — Positioning, Problem, Solution & Value Propositions
DEMO_GUIDE.md
 — Demo Mode Specification & 14-Step Scenario
DEMO_SCRIPT.md
 — 5-Minute Timed Demonstration Presenter Script
ARCHITECTURE.md
 — Monorepo System Architecture Specification
AI_ARCHITECTURE.md
 — RAG Pipeline, Context Builder & Prompt Injection Defense
AI_SAFETY.md
 — 5-Tier Safety Gatekeeper & Boundary Matrix
SECURITY.md
 — OAuth2, JWT, IDOR Defense & Cryptographic Audit Logs
EVALUATION.md
 — Synthetic Evaluation Methodology & Benchmark Results
KNOWN_LIMITATIONS.md
 — Technical, Clinical & Regulatory Limitations
PORTFOLIO_CASE_STUDY.md
 — Full Engineering Case Study for Portfolios
RECRUITER_SUMMARY.md
 — Technical Skills Briefing for Hiring Managers
INVESTOR_SUMMARY.md
 — Executive Strategic Briefing & Business Models
VALIDATION_PLAN.md
 — Non-Leading Interview Protocols & Validation Scorecard
PILOT_READINESS.md
 — Prerequisites Before Clinical Pilot Deployments
FUTURE_ROADMAP.md
 — Near, Medium & Long-Term Post-MVP Roadmap
