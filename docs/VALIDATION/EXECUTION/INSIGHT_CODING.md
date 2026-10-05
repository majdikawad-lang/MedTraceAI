# MedTrace AI — Standardized Qualitative Insight Coding Taxonomy

## Overview
This document defines the 23 standardized qualitative coding tags used by research leads to categorize observations, feedback, verbatim quotes, and usability issues across validation sessions.

---

## Master Coding Taxonomy

```
┌────────────────────────────────────────────────────────────────────────┐
│                        INSIGHT CODING TAXONOMY                         │
├────────────────────────────────────────────────────────────────────────┤
│ UX Domain            │ Trust Domain           │ Safety Domain          │
│ - UX-01 Navigation   │ - TR-01 Evidence       │ - SF-01 Diagnostic Mis │
│ - UX-02 Terminology  │ - TR-02 Uncertainty    │ - SF-02 Medication Mis │
│ - UX-03 Info Density │ - TR-03 Accuracy Perc  │ - SF-03 Emergency Mis  │
│ - UX-04 Comprehesion │ - TR-04 Transparency   │ - SF-04 Over-Reliance  │
├──────────────────────┼────────────────────────┼────────────────────────┤
│ Privacy Domain       │ Workflow Domain        │ Business Domain        │
│ - PR-01 Data Storage │ - CW-01 Doctor Brief   │ - BS-01 Willingness Use│
│ - PR-02 Sharing Link │ - CW-02 Timeline Graph │ - BS-02 Willingness Pay│
│ - PR-03 Access Ctrl  │ - CW-03 Missing Info   │ - BS-03 Buyer Persona  │
│                      │ - CW-04 Verification   │ - BS-04 Pilot Barrier  │
└──────────────────────┴────────────────────────┴────────────────────────┘
```

---

## Detailed Tag Definitions & Examples

### 1. User Experience & Design Domain (`UX`)
- **`UX-01` (Navigation):** Scrolling, tab selection, screen transitions, or mobile responsiveness.
- **`UX-02` (Terminology):** Participant reaction to copy terms such as *"Information Gap"*, *"Medical Blind Spot"*, or *"eGFR Slope"*.
- **`UX-03` (Information Density):** Cognitive load, visual clutter, or desire for simpler text layouts.
- **`UX-04` (Comprehension):** Ability to explain unassisted what the screen or graph represents.

---

### 2. System & Citation Trust Domain (`TR`)
- **`TR-01` (Evidence):** Reaction to supporting literature cards and DOI/PMID links.
- **`TR-02` (AI Uncertainty):** Perception of explicit hedging language (*"Clinical review recommended"*).
- **`TR-03` (Accuracy Perception):** Participant belief in the accuracy of calculated trends or extracted facts.
- **`TR-04` (Transparency):** Confidence derived from viewing raw source document references.

---

### 3. Safety & Boundary Domain (`SF`)
- **`SF-01` (Diagnostic Misunderstanding):** Participant interprets an observation as an automated medical diagnosis of disease.
- **`SF-02` (Medication Misunderstanding):** Participant interprets a medication alert as an instruction to alter dosage without a doctor.
- **`SF-03` (Emergency Misunderstanding):** Failure or delay in recognizing static 911 / Emergency Room redirection for acute red-flag symptoms.
- **`SF-04` (Over-Reliance):** Participant expresses tendency to trust AI outputs blindly without checking raw records or consulting a physician.

---

### 4. Privacy & Sharing Domain (`PR`)
- **`PR-01` (Data Storage Concern):** Hesitation regarding cloud storage of health history records.
- **`PR-02` (Sharing Concern):** Hesitation regarding generating physician share links.
- **`PR-03` (Access Control):** Reaction to time-bounded 7-day share windows and instant revocation controls.

---

### 5. Clinical Workflow Domain (`CW`)
- **`CW-01` (Doctor Brief):** Physician feedback on 1-page pre-visit summary brevity, relevance, and formatting.
- **`CW-02` (Timeline Utility):** Clinician assessment of multi-year event trajectory graphing.
- **`CW-03` (Missing Information):** Physician reaction to surfaced baseline lab gaps (uACR).
- **`CW-04` (Verification Burden):** Physician perception of time required to manually double-check summarized claims.

---

### 6. Business & Monetization Domain (`BS`)
- **`BS-01` (Willingness to Use):** Participant intention to adopt MedTrace AI in daily life or practice.
- **`BS-02` (Willingness to Pay):** Participant feedback on pricing models (free, B2C sub, paid by clinic).
- **`BS-03` (Buyer Persona):** Identification of organizational budget owners (Practice Manager, CMO, Health System IT).
- **`BS-04` (Pilot Barrier):** Technical, compliance, or operational prerequisites required before agreeing to a pilot.
