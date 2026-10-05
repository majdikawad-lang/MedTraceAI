# MedTrace AI — 5-Minute Demonstration Script

## Overview
This script guides a presenter through a concise, 5-minute end-to-end walk-through of **MedTrace AI**. It is structured for a non-technical audience (investors, clinical partners, recruiters, and prospective users).

---

## Timed Demonstration Flow

```
┌────────────────────────────────────────────────────────────────────────┐
│  0:00–0:30 │ Problem Statement                                        │
│  0:30–1:00 │ Product Positioning: What MedTrace AI Is                 │
│  1:00–2:00 │ Medical Timeline & Longitudinal Changes                  │
│  2:00–2:45 │ Lab Intelligence, Medications & Information Gaps         │
│  2:45–3:30 │ AI Engine, RAG Evidence & Safety Guardrails               │
│  3:30–4:30 │ Generating the Doctor Brief                              │
│  4:30–5:00 │ Controlled Sharing, Revocation & Closing                 │
└────────────────────────────────────────────────────────────────────────┘
```

---

## Script & Step-by-Step Action Plan

### 0:00 – 0:30 | Problem Statement
**Presenter Script:**
> “When patients manage chronic health conditions, their medical records are scattered across clinic portals, lab PDF attachments, and self-logged symptom notes. Critical changes—like a gradual drop in kidney function combined with a newly added over-the-counter pill—get lost in the noise. With physicians constrained to less than 15 minutes per visit, connecting these longitudinal dots is an overwhelming challenge.”

---

### 0:30 – 1:00 | What MedTrace AI Is (Product Positioning)
**Presenter Script:**
> “Meet MedTrace AI — *Your Medical Second Brain*. MedTrace AI organizes fragmented longitudinal records into a single interactive timeline, highlights what changed over time, surfaces information gaps, and retrieves supporting medical evidence. Crucially, MedTrace AI is NOT an AI doctor—it does not diagnose or prescribe, but serves as a safety-first clinical decision-support tool for patients and physicians.”

---

### 1:00 – 2:00 | Medical Timeline & What Changed (Steps 1–3)
**Action:** Point out the **Header & Synthetic Patient Badge**, then click the **Timeline Tab**.

**Presenter Script:**
> **[Step 1 & 2]** “We are viewing synthetic demonstration data for Alex Rivera, a 58-year-old managing hypertension and type 2 diabetes. Notice the explicit 'SYNTHETIC DEMONSTRATION DATA' badge in our header.”  
> **[Step 3]** “Navigating to the Medical Timeline, MedTrace AI merges two years of events into a single chronological trajectory: baseline physicals, symptom logs, medication changes, and lab dates. We can instantly trace his trajectory from baseline health in 2024 to recent symptom onset in early 2026.”

---

### 2:00 – 2:45 | Labs, Medications & Information Gaps (Steps 4–7)
**Action:** Click **Lab Trends Tab**, then **Medications Tab**, then **Info Gaps Tab**.

**Presenter Script:**
> **[Step 4 & 5]** “Under Lab Trends, MedTrace AI automatically graphs key biomarkers. Notice how eGFR declined from 88 to 54 mL/min/1.73m² between March 2024 and February 2026—a significant drop into Stage 3a kidney impairment.”  
> **[Step 6 & 7]** “Switching to Medications, MedTrace AI cross-references his active prescription Lisinopril with a recently self-logged OTC NSAID, Ibuprofen. The system surfaces a potential medication discrepancy: NSAID use combined with an ACE inhibitor during active renal function decline.”  
> “Under Information Gaps, MedTrace AI automatically asks: *'Has a urine albumin-to-creatinine ratio (UACR) been ordered recently to evaluate renal function deterioration?'*”

---

### 2:45 – 3:30 | AI Engine, RAG Evidence & Safety Guardrails (Steps 8–10)
**Action:** Navigate to **RAG Evidence Tab**, enter query: *"What are the clinical considerations for eGFR 54 in a patient taking Metformin and Ibuprofen?"*

**Presenter Script:**
> **[Step 8 & 9]** “When asking a medical context question, MedTrace AI uses Hybrid Vector Retrieval to pull indexed medical literature and patient record facts.”  
> **[Step 10]** “The output strictly separates recorded patient facts, longitudinal trends, AI observations, missing information, evidence citations, and safety boundaries. Notice every statement links to a source. If a user asks for diagnostic or prescribing advice, our 5-Tier Safety Gate refrains and directs the user to professional care.”

---

### 3:30 – 4:30 | Generating the Doctor Brief (Step 11)
**Action:** Click **Doctor Brief Tab** and click **Generate Doctor Brief**.

**Presenter Script:**
> **[Step 11]** “Before his upcoming clinical appointment, Alex clicks 'Generate Doctor Brief'. In seconds, MedTrace AI compiles a concise clinical summary featuring:  
> 1. Chief concern and symptom timeline  
> 2. Active prescription & OTC medication overview  
> 3. Critical lab trend (eGFR decline from 88 to 54)  
> 4. Surfaced information gaps & suggested discussion points  
> 5. Supporting evidence citations  
> This allows the physician to absorb two years of complex medical context in under 60 seconds.”

---

### 4:30 – 5:00 | Controlled Sharing & Closing Value Proposition (Steps 12–14)
**Action:** Click **Sharing Controls Tab**, demonstrate link generation, timeframe selection, and instant revocation.

**Presenter Script:**
> **[Step 12, 13 & 14]** “Finally, Alex can grant time-bounded, PIN-protected access to his consulting physician. He selects a 7-day share window. If needed, access can be revoked instantly with one click, preserving total patient data sovereignty.”  
> “In summary, MedTrace AI transforms fragmented medical chaos into structured, evidence-backed longitudinal clarity—helping patients prepare for visits and supporting doctors with rapid context. Thank you!”

---

## Demo Checklist for Presenter
- [x] Backend verified on `http://localhost:8000`
- [x] Frontend running on `http://localhost:5173`
- [x] Header displays `SYNTHETIC DEMONSTRATION DATA`
- [x] All 14 interactive demo steps verified in browser
