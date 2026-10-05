# MedTrace AI — Controlled Validation Execution Kit

## 1. Executive Purpose & Operational Boundary

This kit provides the operational instructions, task cards, observation sheets, scoring matrices, coding taxonomies, and reporting templates required to conduct structured, reproducible product validation sessions for **MedTrace AI** (`v0.1.0-mvp-rc`).

> [!IMPORTANT]
> **Product Validation Disclaimer**  
> This kit is designed for **product validation** (evaluating usability, comprehension, trust, perceived value, privacy confidence, and clinical workflow fit). It is **NOT** designed for clinical research, diagnostic accuracy trials, or clinical effectiveness evaluation.

---

## 2. Who Should Use This Execution Kit

- **Product Researchers & Facilitators:** To conduct standardized 30–45 minute validation sessions with patients, physicians, technical reviewers, and clinic decision-makers without improvising methodology.
- **Observers & Notetakers:** To record empirical user actions, task completion times, confusion points, verbatim quotes, and safety reactions using standardized observation sheets.
- **Clinical & AI Strategy Leads:** To synthesize qualitative and quantitative session logs into evidence-based GO / ITERATE / PIVOT recommendations.

---

## 3. Strict Operational Rules

```
┌────────────────────────────────────────────────────────────────────────┐
│                        STRICT OPERATIONAL RULES                        │
├────────────────────────────────────────────────────────────────────────┤
│ 1. Synthetic Data Only   │ All testing MUST use the pre-loaded Alex    │
│                          │ Rivera synthetic profile (pt_984102).       │
│ 2. Zero Real PHI         │ Never upload, process, or request real      │
│                          │ patient health records or identifying data. │
│ 3. Non-Leading Inquiry   │ Observe behavior BEFORE asking opinions.    │
│                          │ Never coach or defend the product.          │
│ 4. Safety Boundary       │ MedTrace AI is an informational context    │
│                          │ tool — NOT an AI doctor; never diagnose/prescribe.│
│ 5. No Fabrication        │ Record empirical data only. If zero sessions│
│                          │ have occurred, write 'No results available'.│
└────────────────────────────────────────────────────────────────────────┘
```

---

## 4. Execution Kit Structure

The execution suite is organized into 15 modular operational guides:

- [`SESSION_PROTOCOL.md`](file:///c:/Users/DELL/Desktop/MedTrace_AI/docs/VALIDATION/EXECUTION/SESSION_PROTOCOL.md) — Master 30–45 minute session structure across 9 phases.
- [`PATIENT_SESSION.md`](file:///c:/Users/DELL/Desktop/MedTrace_AI/docs/VALIDATION/EXECUTION/PATIENT_SESSION.md) — 12-phase complete patient/caregiver session script.
- [`PHYSICIAN_SESSION.md`](file:///c:/Users/DELL/Desktop/MedTrace_AI/docs/VALIDATION/EXECUTION/PHYSICIAN_SESSION.md) — Physician pre-visit workflow & Doctor Brief evaluation script.
- [`TECHNICAL_REVIEW_SESSION.md`](file:///c:/Users/DELL/Desktop/MedTrace_AI/docs/VALIDATION/EXECUTION/TECHNICAL_REVIEW_SESSION.md) — Security, architecture, RAG, and audit log review protocol.
- [`B2B_DISCOVERY_SESSION.md`](file:///c:/Users/DELL/Desktop/MedTrace_AI/docs/VALIDATION/EXECUTION/B2B_DISCOVERY_SESSION.md) — Clinic workflow pain, buyer persona, and SaaS model protocol.
- [`TASK_CARDS.md`](file:///c:/Users/DELL/Desktop/MedTrace_AI/docs/VALIDATION/EXECUTION/TASK_CARDS.md) — Standalone task cards for all 11 product capabilities.
- [`OBSERVATION_SHEET.md`](file:///c:/Users/DELL/Desktop/MedTrace_AI/docs/VALIDATION/EXECUTION/OBSERVATION_SHEET.md) — Empirical task observation and event capture log.
- [`SESSION_SCORECARD.md`](file:///c:/Users/DELL/Desktop/MedTrace_AI/docs/VALIDATION/EXECUTION/SESSION_SCORECARD.md) — 1–5 numerical Likert scoring matrix across 15 product dimensions.
- [`ISSUE_SEVERITY.md`](file:///c:/Users/DELL/Desktop/MedTrace_AI/docs/VALIDATION/EXECUTION/ISSUE_SEVERITY.md) — Four-tier issue taxonomy (Critical, High, Medium, Low).
- [`PARTICIPANT_TRACKER.md`](file:///c:/Users/DELL/Desktop/MedTrace_AI/docs/VALIDATION/EXECUTION/PARTICIPANT_TRACKER.md) — Anonymous participant registry (`P001`, `P002`, `P003`).
- [`SESSION_SUMMARY.md`](file:///c:/Users/DELL/Desktop/MedTrace_AI/docs/VALIDATION/EXECUTION/SESSION_SUMMARY.md) — Post-session synthesis and evidence tagging template.
- [`INSIGHT_CODING.md`](file:///c:/Users/DELL/Desktop/MedTrace_AI/docs/VALIDATION/EXECUTION/INSIGHT_CODING.md) — Standardized qualitative coding taxonomy (`UX-01`, `TR-02`, `SF-01`).
- [`DECISION_MATRIX.md`](file:///c:/Users/DELL/Desktop/MedTrace_AI/docs/VALIDATION/EXECUTION/DECISION_MATRIX.md) — GO / ITERATE / PIVOT strategic decision framework.
- [`VALIDATION_DATA_DICTIONARY.md`](file:///c:/Users/DELL/Desktop/MedTrace_AI/docs/VALIDATION/EXECUTION/VALIDATION_DATA_DICTIONARY.md) — Complete data dictionary for all metrics and variables.
