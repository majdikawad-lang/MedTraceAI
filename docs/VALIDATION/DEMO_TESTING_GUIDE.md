# MedTrace AI — Controlled Synthetic Usability Testing Guide

## Overview
This document provides a 14-step structured usability testing protocol for observing real participants as they interact with **MedTrace AI** in Demo Mode.

> [!WARNING]
> **Synthetic Patient Profile Boundary**  
> All testing utilizes the pre-loaded synthetic profile for **Alex Rivera** (ID: `pt_984102`, 58y Male). Under no circumstances will real patient health information be introduced. Facilitators must capture empirical participant behaviors, confusion, errors, and trust reactions without inserting fabricated results.

---

## 14-Step Usability Observation Protocol

```
┌────────────────────────────────────────────────────────────────────────┐
│                        14-STEP USABILITY FLOW                          │
├────────────────────────────────────────────────────────────────────────┤
│ Step 1: Open MedTrace AI        │ Step 8: Explore Medical Blind Spots  │
│ Step 2: View Patient Profile    │ Step 9: Ask Medical Context Question │
│ Step 3: Review Timeline         │ Step 10: Observe Citations/Evidence  │
│ Step 4: Identify Changes        │ Step 11: Observe Safety Behavior     │
│ Step 5: Review Lab Intelligence │ Step 12: Generate Doctor Brief       │
│ Step 6: Review Medications      │ Step 13: Review Controlled Sharing   │
│ Step 7: Explore Info Gaps       │ Step 14: Test Sharing Revocation     │
└────────────────────────────────────────────────────────────────────────┘
```

---

## Step-by-Step Task Observation Worksheets

### Step 1: Open MedTrace AI & Header Orientation
- **Task:** Instruct participant to open `http://localhost:5173` and observe the header.
- **Expected Behavior:** Participant notices product title and the blue `SYNTHETIC DEMONSTRATION DATA` header badge.
- **Observation Fields to Capture:**
  - *Task Completion:* Success / Assisted / Failed
  - *Time Spent:* _____ seconds
  - *User Behavior & Verbalization:* ___________________________________________
  - *Points of Confusion:* ____________________________________________________
  - *Trust / Safety Reaction:* Did user recognize synthetic data badge? (Yes/No)

---

### Step 2: Understand Patient Profile
- **Task:** Ask participant to identify who this profile belongs to and their primary medical conditions.
- **Expected Behavior:** Participant correctly identifies Alex Rivera (58y M), Type 2 Diabetes, Hypertension, and Dr. Sarah Jenkins.
- **Observation Fields to Capture:**
  - *Task Completion:* Success / Assisted / Failed | *Time:* _____ sec
  - *User Behavior:* __________________________________________________________
  - *Errors / Confusion:* ____________________________________________________

---

### Step 3: Review Medical Timeline
- **Task:** Ask participant to navigate to the **Timeline Tab** and locate events from 2024 to 2026.
- **Expected Behavior:** Participant scrolls through chronological events (routine physical, symptom onset, lab tests).
- **Observation Fields to Capture:**
  - *Task Completion:* Success / Assisted / Failed | *Time:* _____ sec
  - *User Behavior:* __________________________________________________________
  - *Questions Asked:* _______________________________________________________

---

### Step 4: Identify Important Changes Over Time
- **Task:** Ask participant: *"Looking at the timeline or summary, what significant health changes occurred between 2024 and 2026?"*
- **Expected Behavior:** Participant identifies symptom onset (ankle swelling) and medication additions (OTC Ibuprofen).
- **Observation Fields to Capture:**
  - *Task Completion:* Success / Assisted / Failed | *Time:* _____ sec
  - *User Behavior:* __________________________________________________________
  - *Cognitive Load / Confusion:* ___________________________________________

---

### Step 5: Review Laboratory Trends & Biomarkers
- **Task:** Ask participant to click **Lab Trends Tab** and examine the eGFR chart.
- **Expected Behavior:** Participant identifies the downward trajectory of eGFR (from 84 to 58 mL/min/1.73m²).
- **Observation Fields to Capture:**
  - *Task Completion:* Success / Assisted / Failed | *Time:* _____ sec
  - *User Behavior:* Does user understand eGFR drop? _________________________
  - *Trust Reaction to Graphing:* ___________________________________________

---

### Step 6: Review Medication History & Discrepancies
- **Task:** Ask participant to click **Medications Tab** and review active prescriptions and OTC additions.
- **Expected Behavior:** Participant sees Lisinopril, Metformin, and OTC Ibuprofen, noting the ACE inhibitor + NSAID discrepancy.
- **Observation Fields to Capture:**
  - *Task Completion:* Success / Assisted / Failed | *Time:* _____ sec
  - *Safety Concern / Misinterpretation:* Does user think AI altered dose? (Yes/No)

---

### Step 7: Explore Information Gaps
- **Task:** Ask participant to click **Info Gaps Tab** and explain what the system is asking.
- **Expected Behavior:** Participant reads the missing baseline lab question (uACR / OTC Ibuprofen frequency).
- **Observation Fields to Capture:**
  - *Task Completion:* Success / Assisted / Failed | *Time:* _____ sec
  - *Perceived Utility:* Actionable / Confusing / Alarming ___________________

---

### Step 8: Explore Medical Blind Spots
- **Task:** Ask participant to navigate to **Medical Blind Spots Tab** and review a flagged item.
- **Expected Behavior:** Participant reads the eGFR decline alert and suggested physician discussion questions.
- **Observation Fields to Capture:**
  - *Task Completion:* Success / Assisted / Failed | *Time:* _____ sec
  - *Reaction to Term 'Blind Spot':* Helpful alert vs Diagnostic fear ________

---

### Step 9: Ask a Medical Context Question (RAG Engine)
- **Task:** Instruct participant to navigate to **RAG Evidence Tab** and submit a query (e.g., *"What are clinical considerations for eGFR 58 with Lisinopril and Ibuprofen?"*).
- **Expected Behavior:** System retrieves structured facts, trends, observations, citations, and safety warnings.
- **Observation Fields to Capture:**
  - *Task Completion:* Success / Assisted / Failed | *Time:* _____ sec
  - *User Comprehension of Response:* ________________________________________

---

### Step 10: Observe Evidence & Citations
- **Task:** Ask participant to click on a supporting evidence citation card (e.g., KDIGO 2024 guideline).
- **Expected Behavior:** Participant inspects the DOI link and literature snippet.
- **Observation Fields to Capture:**
  - *Task Completion:* Success / Assisted / Failed | *Time:* _____ sec
  - *Impact on Trust:* High trust / Neutral / Low trust ____________________

---

### Step 11: Observe Safety Behavior & Refusal Boundary
- **Task:** Instruct participant to enter a diagnostic query (e.g., *"Do I have chronic kidney disease?"* or *"Should I stop taking Lisinopril?"*).
- **Expected Behavior:** System categorizes request as `UNSAFE / MUST REFUSE` and displays non-diagnostic boundary refusal.
- **Observation Fields to Capture:**
  - *Task Completion:* Success / Assisted / Failed | *Time:* _____ sec
  - *User Safety Perception:* Did user understand why system refused? _______

---

### Step 12: Generate Doctor Brief
- **Task:** Ask participant to navigate to **Doctor Brief Tab** and click **Generate Doctor Brief**.
- **Expected Behavior:** 1-page clinical summary renders containing chief concern, meds, lab trend graph, gaps, and evidence links.
- **Observation Fields to Capture:**
  - *Task Completion:* Success / Assisted / Failed | *Time:* _____ sec
  - *Perceived Value of Brief:* _____________________________________________

---

### Step 13: Review Controlled Sharing
- **Task:** Instruct participant to navigate to **Sharing Controls Tab** and click **Create Temporary Access Pass**.
- **Expected Behavior:** User configures recipient, timeframe (e.g., 6 months), and generates share link.
- **Observation Fields to Capture:**
  - *Task Completion:* Success / Assisted / Failed | *Time:* _____ sec
  - *Privacy Confidence:* High / Medium / Low ________________________________

---

### Step 14: Test Sharing Revocation
- **Task:** Instruct participant to click **Revoke Access Immediately** on an active share grant.
- **Expected Behavior:** Grant status instantly changes to `REVOKED`.
- **Observation Fields to Capture:**
  - *Task Completion:* Success / Assisted / Failed | *Time:* _____ sec
  - *User Feeling of Data Control:* ___________________________________________
