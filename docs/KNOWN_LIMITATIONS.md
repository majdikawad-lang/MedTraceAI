# MedTrace AI — Known Limitations & Technical Disclaimers

**Version:** `v0.1.0-mvp-rc` (Release Candidate)

---

## 1. Evaluation & Benchmark Limitations

- **Synthetic Benchmark Only:** All evaluation metrics (0.4% claim-contradiction rate, 98.5% citation precision) were measured exclusively on a 15-case synthetic, non-PHI evaluation dataset.
- **Limited Benchmark Size:** A dataset of 15 synthetic patient trajectories is insufficient to generalize across diverse clinical subspecialties, complex comorbidities, or edge-case medical histories.
- **Need for Expert Physician Review:** Metrics were evaluated via automated string/entity comparison scripts. Rigorous clinical validation requires blind multi-specialist physician review panels.

---

## 2. Regulatory & Clinical Boundary Disclaimers

- **Not an AI Doctor:** MedTrace AI provides informational decision support only. It does **not** diagnose diseases, prescribe medication, adjust dosages, or direct treatment pathways.
- **No FDA Clearance / CE Mark:** The platform is designed around Clinical Decision Support (CDS) exemption principles under US Cures Act Section 520(o)(1)(E), but has **not** received formal FDA clearance (510k/De Novo/SaMD) or European CE Mark certification.
- **No Certification for Real Clinical Use:** The current MVP Release Candidate is intended strictly for demonstration and research validation. It is **not** authorized for real patient deployment or clinical care.

---

## 3. EHR Interoperability & Integration Limitations

- **Architectural Readiness Only:** Data structures for FHIR R4 resources (`Patient`, `Observation`, `MedicationStatement`) and HL7 v2 messages are defined conceptually, but native Epic (Hyperspace) or Cerner (PowerChart) sandbox API connectors are **not** live.
- **No Direct Portal Ingestion:** The current MVP relies on pre-loaded synthetic database state or user manual inputs; automatic EHR patient portal sync is a post-MVP roadmap item.

---

## 4. Production Infrastructure Requirements

- **In-Process RAG Execution:** Document embedding generation runs synchronously within backend API handlers; production scaling requires offloading to Celery + Redis worker queues.
- **Privacy & Compliance Review Needed:** Formal Business Associate Agreements (BAAs), third-party penetration testing, and independent SOC 2 Type II audits must be completed prior to processing real Protected Health Information (PHI).
