# MedTrace AI — Controlled Clinical Pilot Readiness Requirements

## Overview
This document defines the strict technical, legal, clinical, and security prerequisites that **must be satisfied** before MedTrace AI can transition from the current Controlled MVP Demonstration Stage to a controlled pilot involving real users or real Protected Health Information (PHI).

> [!CAUTION]
> **STRICT NON-APPROVAL NOTICE**  
> The current MVP Release Candidate (`v0.1.0-mvp-rc`) is **NOT automatically approved for real clinical use or live patient deployments**. It is intended strictly for controlled synthetic demonstration, technical evaluation, and user interviews.

---

## Non-Negotiable Pilot Readiness Criteria

```
┌────────────────────────────────────────────────────────────────────────┐
│                      PILOT READINESS GATEWAY                           │
├────────────────────────────────────────────────────────────────────────┤
│ [ ] 1. Independent Security & Pen-Test Review                          │
│ [ ] 2. HIPAA Privacy & BAA Execution Review                            │
│ [ ] 3. Formal Legal & Regulatory CDS Exemption Assessment              │
│ [ ] 4. Multi-Specialist Clinical Expert Review Panel                   │
│ [ ] 5. Real-World AI Failure & Hallucination Analysis                  │
│ [ ] 6. Informed Patient Consent & Transparency Model                   │
│ [ ] 7. Data Retention & Revocation Lifecycle Policy                    │
│ [ ] 8. Incident Response & 24/7 Security Incident Playbook             │
│ [ ] 9. System Telemetry & Observability Monitoring                     │
│ [ ] 10. Enterprise Secure Cloud Infrastructure                         │
└────────────────────────────────────────────────────────────────────────┘
```

---

## 1. Technical & Security Prerequisites
1. **Third-Party Penetration Test:** Execution of a formal penetration test by an accredited cybersecurity firm covering API authentication, BOLA/IDOR isolation, and prompt injection defense.
2. **KMS / Secrets Management:** Migration of JWT secrets and API tokens to AWS KMS, Azure Key Vault, or GCP Secret Manager with automated 90-day rotation.
3. **Asynchronous Processing Architecture:** Offloading vector embedding generation and PDF parsing to background Celery workers backed by Redis.

---

## 2. Privacy, Legal & Regulatory Prerequisites
1. **Business Associate Agreements (BAAs):** Formal execution of signed BAAs with hosting infrastructure (e.g., AWS/GCP HIPAA tier) and LLM API vendors.
2. **Regulatory Legal Opinion:** Formal legal opinion confirming eligibility for Clinical Decision Support (CDS) exemption under US Cures Act Section 520(o)(1)(E).
3. **Informed Consent Framework:** Implementation of explicit, plain-language patient consent flows explaining the decision-support boundary, data processing, and user controls.

---

## 3. Clinical & Safety Prerequisites
1. **Multi-Specialist Clinical Review:** Formal evaluation of synthesized Doctor Briefs across 50 real-world retrospective de-identified trajectories by a panel of board-certified internal medicine physicians.
2. **Failure Analysis Protocol:** Establishment of a clinical safety review committee to analyze false positives, false negatives, and hallucination edge cases before deployment.
3. **Data Retention & Erasure:** Implementation of automated 30-day log purging and explicit "Right-to-be-Forgotten" patient data destruction pipelines.
