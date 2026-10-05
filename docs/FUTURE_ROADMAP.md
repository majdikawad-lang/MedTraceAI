# MedTrace AI — Post-MVP Product Roadmap

**Status:** Intentional Post-MVP Features (NOT implemented in current `v0.1.0-mvp-rc` Release Candidate Freeze)

---

## 📌 Near-Term Phase (0 to 3 Months) — Validation & Refinement

- **Structured Patient Validation:** Conduct non-leading qualitative interviews and scorecard evaluations with chronic disease patients and caregivers.
- **Structured Physician Validation:** Evaluate pre-visit Doctor Brief utility and workflow integration with primary care physicians.
- **UX & Accessibility Polish:** Mobile web timeline gestures, high-contrast dark mode accessibility tweaks, and keyboard navigation.
- **Expanded AI Benchmarking:** Expand evaluation suite from 15 synthetic cases to 50 multi-specialist retrospective synthetic trajectories.
- **Enhanced Telemetry & Observability:** Integrate structured JSON logging with OpenTelemetry tracing across API endpoints.

---

## 📌 Medium-Term Phase (3 to 9 Months) — Scaling & Interoperability

- **Asynchronous Ingestion Pipeline:** Migrate document parsing and vector embedding generation to Celery + Redis worker queues.
- **Production Key Management:** Secure secret management via cloud KMS with automated key rotation.
- **Enhanced Patient Consent Controls:** Multi-tiered granular consent management for specific medical data categories (e.g., mental health, genetics).
- **Clinic Pre-Visit Workflow Portal:** Dedicated physician dashboard for reviewing upcoming patient briefs prior to appointments.
- **Architectural FHIR R4 Connectors:** Live sandbox connectors for standard FHIR resources (`Patient`, `Observation`, `MedicationStatement`, `Condition`).
- **EHR Sandbox Integration:** Testing read-only data ingestion inside Epic (MyChart) and Cerner sandbox environments.

---

## 📌 Long-Term Phase (9 to 18 Months) — Enterprise & Regulatory Maturity

- **Enterprise Healthcare Deployments:** Multi-tenant deployment options for large hospital systems and Accountable Care Organizations (ACOs).
- **Advanced Diagnostic Imaging Metadata:** Surface radiologist summary text (non-image CV) within longitudinal timeline.
- **Large-Scale Multi-Center Clinical Evaluation:** Blinded multi-center clinical trials evaluating Doctor Brief time savings and diagnostic discrepancy surfacing.
- **Formal Regulatory Pathway Assessment:** Evaluate formal FDA SaMD clearance requirements and CE Mark compliance strategy.
