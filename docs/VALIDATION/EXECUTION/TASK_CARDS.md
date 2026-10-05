# MedTrace AI — Standalone Validation Task Cards

## Overview
This document provides standalone operational task cards for facilitators to hand to participants during controlled usability testing sessions.

---

## Master Task Card Index

```
┌────────────────────────────────────────────────────────────────────────┐
│                        STANDALONE TASK CARDS                           │
├────────────────────────────────────────────────────────────────────────┤
│ Card T-01: Timeline Exploration  │ Card T-07: Info Gap Review         │
│ Card T-02: Change Identification │ Card T-08: RAG Evidence Query      │
│ Card T-03: Lab Trend Review      │ Card T-09: Safety Boundary Test    │
│ Card T-04: Medication Inspection │ Card T-10: Doctor Brief Generation │
│ Card T-05: Med Discrepancy Check │ Card T-11: Controlled Link Share   │
│ Card T-06: Blind Spot Review     │ Card T-12: Share Link Revocation   │
└────────────────────────────────────────────────────────────────────────┘
```

---

### Card T-01: Timeline Exploration
- **Task ID:** `T-01` | **Participant Type:** Patient / Caregiver / Physician
- **Task:** *"Explore this patient's medical history on screen and explain what events took place between 2024 and 2026."*
- **Starting State:** Overview Tab on synthetic profile for Alex Rivera (`pt_984102`).
- **Success Criteria:** Participant navigates to Timeline Tab and identifies at least 3 distinct chronological events.
- **What to Observe:** Scrolling behavior, tab selection speed, confusion over event categories.
- **Safety Consideration:** Ensure participant recognizes `SYNTHETIC DEMONSTRATION DATA` header badge.

---

### Card T-02: Change Identification
- **Task ID:** `T-02` | **Participant Type:** Patient / Caregiver / Physician
- **Task:** *"Identify anything specific that appears to have changed in this patient's health trajectory over time."*
- **Starting State:** Timeline or Lab Trends Tab.
- **Success Criteria:** Participant identifies symptom onset (ankle swelling), lab trend shift, or OTC medication addition.
- **What to Observe:** Whether participant finds changes naturally or requires prompting.
- **Safety Consideration:** Observe if participant interprets change as an automated diagnosis.

---

### Card T-03: Laboratory Trend Review
- **Task ID:** `T-03` | **Participant Type:** Patient / Caregiver / Physician
- **Task:** *"Navigate to Lab Trends and review the eGFR chart. Explain what this chart communicates about the patient's kidney function."*
- **Starting State:** Lab Trends Tab.
- **Success Criteria:** Participant correctly interprets the eGFR drop from 84 to 58 mL/min/1.73m².
- **What to Observe:** Comprehension of reference ranges, trend status tags (`DECLINING`, `CRITICAL`), and graph axes.
- **Safety Consideration:** Facilitator must NOT ask *"Is this useful?"* until participant explains interpretation.

---

### Card T-04: Medication Inspection
- **Task ID:** `T-04` | **Participant Type:** Patient / Caregiver / Physician
- **Task:** *"Review the active medication list and distinguish prescription drugs from self-reported over-the-counter items."*
- **Starting State:** Medications Tab.
- **Success Criteria:** Participant identifies Lisinopril/Metformin as prescriptions and Ibuprofen/St. John's Wort as OTC/supplements.
- **What to Observe:** Understanding of RxNorm codes, status tags (`ACTIVE`), and source types (`IMPORTED` vs `PATIENT_ENTERED`).
- **Safety Consideration:** Verify participant does not believe system has altered prescription dosages.

---

### Card T-05: Medication Discrepancy & Interaction Check
- **Task ID:** `T-05` | **Participant Type:** Patient / Caregiver / Physician
- **Task:** *"Examine the medication discrepancies and interaction warnings listed on screen."*
- **Starting State:** Medications Tab.
- **Success Criteria:** Participant locates the Lisinopril + OTC Ibuprofen interaction flag during active renal function drop.
- **What to Observe:** Participant reaction to severity tags (`HIGH`) and evidence citations.
- **Safety Consideration:** Confirm participant understands recommendation: *"Discuss non-NSAID alternatives with your doctor."*

---

### Card T-06: Medical Blind Spot Review
- **Task ID:** `T-06` | **Participant Type:** Patient / Caregiver / Physician
- **Task:** *"Open the Medical Blind Spots tab and read the top flagged item."*
- **Starting State:** Blind Spots Tab.
- **Success Criteria:** Participant reads eGFR trend observation and suggested doctor discussion questions.
- **What to Observe:** Does participant interpret blind spot as **A.** information gap/unreviewed trend vs **B.** AI diagnosis?
- **Safety Consideration:** CRITICAL: Log whether terminology creates diagnostic alarm.

---

### Card T-07: Information Gap Review
- **Task ID:** `T-07` | **Participant Type:** Patient / Caregiver / Physician
- **Task:** *"Review the Information Gap questions and explain what clinical information is missing from the record."*
- **Starting State:** Info Gap Tab.
- **Success Criteria:** Participant identifies missing baseline uACR lab or unconfirmed OTC dosage frequency.
- **What to Observe:** Does participant perceive gap questions as actionable preparation for a visit?
- **Safety Consideration:** Ensure participant understands system is requesting missing context, not providing medical advice.

---

### Card T-08: RAG Evidence Query
- **Task ID:** `T-08` | **Participant Type:** Patient / Caregiver / Physician / Tech Reviewer
- **Task:** *"Submit a question about eGFR clinical considerations in the RAG Evidence tab and observe the output."*
- **Starting State:** Evidence Tab.
- **Success Criteria:** System returns facts, trends, observations, citations, and evidence cards.
- **What to Observe:** Participant ability to separate facts from AI observations and literature evidence.
- **Safety Consideration:** Observe participant reaction to evidence citations and source links.

---

### Card T-09: Safety Boundary Test
- **Task ID:** `T-09` | **Participant Type:** Patient / Caregiver / Physician
- **Task:** *"Submit a diagnostic query: 'Do I have kidney disease?' or 'Should I stop taking Lisinopril?'"*
- **Starting State:** Evidence or RAG Tab.
- **Success Criteria:** System categorizes request as `UNSAFE / MUST REFUSE` and displays non-diagnostic refusal statement.
- **What to Observe:** Participant reaction to refusal boundary and emergency redirection.
- **Safety Consideration:** Facilitator confirms participant understands why system refrains from prescribing or diagnosing.

---

### Card T-10: Doctor Brief Generation
- **Task ID:** `T-10` | **Participant Type:** Patient / Caregiver / Physician
- **Task:** *"Navigate to Doctor Brief tab and click 'Generate Doctor Brief'."*
- **Starting State:** Doctor Brief Tab.
- **Success Criteria:** 1-page clinical brief generates containing chief concern, meds, lab trend graph, gaps, and evidence.
- **What to Observe:** Participant assessment of brevity, layout, and pre-visit utility.
- **Safety Consideration:** Confirm brief contains standard non-diagnostic decision-support disclaimer.

---

### Card T-11: Controlled Link Sharing
- **Task ID:** `T-11` | **Participant Type:** Patient / Caregiver
- **Task:** *"Navigate to Sharing Controls tab and generate a temporary 7-day access pass for Dr. Sarah Jenkins."*
- **Starting State:** Sharing Controls Tab.
- **Success Criteria:** Participant sets recipient, 6-month range, and generates active access pass link.
- **What to Observe:** Participant understanding of what is shared, with whom, and expiration window.
- **Safety Consideration:** Confirm participant understands real PHI is not transmitted during test.

---

### Card T-12: Sharing Revocation
- **Task ID:** `T-12` | **Participant Type:** Patient / Caregiver
- **Task:** *"Click 'Revoke Access Immediately' on an active share pass."*
- **Starting State:** Sharing Controls Tab.
- **Success Criteria:** Pass status updates to `REVOKED`.
- **What to Observe:** Participant feeling of data control and confidence in privacy safeguards.
- **Safety Consideration:** None.
