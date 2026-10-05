# MedTrace AI — AI Safety & Boundary Specification

## 1. Safety Philosophy & Product Boundary
MedTrace AI is built around a safety-first paradigm: **Clinical Decision Support, Not Clinical Decision Making.** The platform is designed to eliminate information overload for patients and clinicians while maintaining an unyielding boundary against non-diagnostic or prescriptive automated behaviors.

---

## 2. Capability Matrix: What MedTrace AI Can & Cannot Do

### What MedTrace AI CAN Do
- **Organize Information:** Consolidates multi-source longitudinal records into a unified chronological timeline.
- **Summarize Records:** Aggregates lengthy clinical notes, discharge summaries, and lab panels into digestible syntheses.
- **Identify Changes:** Detects and visualizes biomarker shifts (e.g., eGFR decline, HbA1c elevation) over time.
- **Identify Missing Information:** Automatically surfaces missing baseline laboratory panels or unmeasured clinical parameters.
- **Provide Contextual Evidence:** Retrieves and cites relevant peer-reviewed medical literature and clinical guidelines.
- **Generate Discussion Points:** Formats structured, objective **Doctor Briefs** to empower informed patient-physician dialogue.

### What MedTrace AI CANNOT Do
- **Cannot Diagnose:** Will never issue medical diagnoses or condition assessments.
- **Cannot Prescribe:** Will never generate or suggest medication prescriptions or dosage recommendations.
- **Cannot Modify Medications:** Will never recommend stopping, starting, or adjusting existing drug regimens.
- **Cannot Replace Physicians:** Will never substitute for qualified, licensed healthcare professional judgment.
- **Cannot Make Autonomous Decisions:** Will never direct autonomous clinical management pathways.

---

## 3. The 5-Tier Safety Gate & Triage System

Every incoming request and outgoing response passes through the static and dynamic `SafetyGatekeeper` engine, which categorizes inputs/outputs into five distinct safety classes:

```
                          ┌───────────────────────────┐
                          │ Incoming Query / Response │
                          └─────────────┬─────────────┘
                                        │
                                        ▼
                         ┌─────────────────────────────┐
                         │ Safety Gatekeeper Triaging  │
                         └──────────────┬──────────────┘
                                        │
      ┌──────────────────┬──────────────┼──────────────┬──────────────────┐
      ▼                  ▼              ▼              ▼                  ▼
┌───────────┐  ┌──────────────────┐ ┌──────────────┐ ┌──────────────────┐ ┌───────────────┐
│   SAFE    │  │NEEDS CLARIFICA-  │ │PROFESSIONAL  │ │  URGENT MEDICAL  │ │ UNSAFE / MUST │
│           │  │      TION        │ │    REVIEW    │ │    ATTENTION     │ │    REFUSE     │
└───────────┘  └──────────────────┘ └──────────────┘ └──────────────────┘ └───────────────┘
  Normal         Missing context      Non-urgent        Immediate Red       Prescriptive /
  summary        prompted to user     discrepancy       Flag redirect       Diagnostic query
  generation                          highlighted       (911 / ER static)   refused
```

### Safety Class Definitions & Actions

| Safety Class | Trigger Criteria | System Action & Output |
|---|---|---|
| **`SAFE`** | Informational summaries, timeline parsing, trend graphing, literature retrieval. | Returns requested informational output with full citation provenance. |
| **`NEEDS CLARIFICATION`** | Ambiguous patient context, unconfirmed OTC dosage, missing date metadata. | Prompts user to clarify specific missing parameters before finalizing summary. |
| **`PROFESSIONAL REVIEW RECOMMENDED`** | Drug-drug interaction detected, subtle eGFR trend decline, conflicting lab units. | Highlights discrepancy with yellow alert banner and adds discussion item to Doctor Brief. |
| **`URGENT MEDICAL ATTENTION`** | Acute red flag symptoms (crushing chest pain, severe dyspnea, stroke signs). | Immediately halts AI generation and displays static 911 / Emergency Room redirection modal. |
| **`UNSAFE / MUST REFUSE`** | Explicit user request for diagnosis (*"Do I have kidney failure?"*) or prescription (*"What dose should I take?"*). | Refuses query with explicit non-diagnostic safety statement directing user to a physician. |

---

## 4. Medical Uncertainty Handling

When clinical data is incomplete, conflicting, or falls below confidence thresholds, MedTrace AI enforces explicit uncertainty handling protocols:
1. **Explicit Epistemic Stance:** Uses transparent hedging language (*"Recorded laboratory values indicate a decline in eGFR from 88 to 54 mL/min/1.73m² over 23 months; clinical interpretation by a physician is recommended"*).
2. **Missing Baseline Alerts:** If baseline data is absent, the system flags the absence rather than extrapolating or guessing.
3. **No Synthetic Extrapolation:** Never fills missing lab dates or missing medication dosages with hallucinated fallback data.
