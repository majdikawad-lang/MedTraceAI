# MedTrace AI — Demo Mode Specification & Guide

## Overview
This document specifies the demonstration mode for **MedTrace AI**. The demo environment allows reviewers, investors, recruiters, and clinical validators to experience the full capabilities of MedTrace AI without exposing or processing any Protected Health Information (PHI).

---

## Data Privacy & Synthetic Data Rules

> [!WARNING]
> **SYNTHETIC DEMONSTRATION DATA ONLY**  
> All patient records, laboratory results, medications, clinical notes, and timeline events loaded in Demo Mode are strictly **synthetic test cases**. Never upload or enter real patient information during a demonstration.

### Synthetic Demo Patient Profile
- **Full Name:** Alex Rivera
- **Age / Gender:** 58 years / Male (Biological Sex: Male)
- **DOB:** 1968-04-12
- **Primary Physician:** Dr. Sarah Jenkins, MD (Internal Medicine)
- **Known Conditions:** Type 2 Diabetes Mellitus, Essential Hypertension, Mild Osteoarthritis (Knee)
- **Allergies:** Penicillin (Hives), Sulfa Drugs (Mild Rash)
- **Previous Procedures:** Arthroscopic Knee Evaluation (2021), Laparoscopic Cholecystectomy (2018)
- **Family History:** Father (T2D & CKD), Mother (Hypertension & Osteoporosis)

---

## Synthetic Longitudinal Event Dataset
The demo environment presents a coherent 2-year longitudinal story for *Alex Rivera*, demonstrating changes across multiple medical parameters:

1. **Historical Baseline Events (March 2024):**
   - Routine Physical Examination — Baseline eGFR 88 mL/min/1.73m², Serum Creatinine 0.9 mg/dL, HbA1c 6.8%.
   - Diagnosis of T2D & Essential Hypertension; Metformin 500mg BID and Lisinopril 10mg Daily started.
2. **Symptom Onset (January–February 2026):**
   - NSAID initiation (Ibuprofen 400mg TID) self-started for knee osteoarthritis (2026-01-10).
   - Bilateral Ankle Swelling logged (2026-01-20) — Mild pedal edema (1+), worsening in evenings.
   - Mild Fatigue & Exertional Dyspnea logged (2026-02-01).
3. **Laboratory Trends & Discrepancies (February 2026):**
   - Follow-up Lab Panel (2026-02-10): eGFR declined from 88 to 54 mL/min/1.73m² (Stage 3a CKD threshold); Serum Creatinine increased from 0.9 to 1.5 mg/dL; HbA1c 7.4%.
   - System highlights concurrent ACE inhibitor (Lisinopril) + NSAID (Ibuprofen) interaction and renal function decline.
4. **Information Gaps Surfaced:**
   - Absence of recent Quantitative Urine Albumin-to-Creatinine Ratio (UACR).
   - Missing clarification on OTC NSAID frequency and duration.
5. **AI Evidence & Citation Layer:**
   - RAG query retrieves clinical guidelines regarding NSAID-induced acute kidney injury risk in patients taking ACE inhibitors and Metformin dosage adjustments at eGFR < 60 mL/min.
6. **Doctor Brief Generation:**
   - Synthesis of chief concern, medication list, eGFR trajectory, surfaced info gaps, and evidence links.
7. **Controlled Sharing & Access Revocation:**
   - Time-bounded (7-day window), PIN-protected physician portal access link generation and instant access revocation.

---

## 14-Step Coherent End-to-End Demo Scenario

| Step | Action | Feature / Screen Shown | Demonstration Purpose |
|---|---|---|---|
| **Step 1** | User enters MedTrace AI | Header / Landing Banner | Verifies `SYNTHETIC DEMONSTRATION DATA` header badge and tagline "Your Medical Second Brain". |
| **Step 2** | User views patient profile | Overview Header | Displays synthetic profile summary for Alex Rivera (58y / M). |
| **Step 3** | User views Medical Timeline | Timeline Tab | Shows 2-year merged chronological event history (visits, labs, symptoms, meds). |
| **Step 4** | User reviews laboratory history | Lab Trends Tab | Displays tabular lab records with reference ranges and abnormal flags. |
| **Step 5** | System highlights relevant changes | Lab Trends Graph | Displays graphical trajectory of eGFR declining from 88 to 54 mL/min/1.73m². |
| **Step 6** | User reviews medication history | Medications Tab | Shows active prescriptions (Lisinopril, Metformin) and self-logged OTC NSAID (Ibuprofen). |
| **Step 7** | System surfaces medication info | Medications Discrepancies | Surfaces ACE inhibitor + NSAID concurrent use discrepancy during renal function decline. |
| **Step 8** | User asks medical-context question | RAG Evidence Tab | User submits query: *"What are the clinical considerations for eGFR 54 in a patient taking Metformin and Ibuprofen?"* |
| **Step 9** | System retrieves relevant evidence | Evidence Cards | System retrieves indexed clinical literature snippets with DOI and source metadata. |
| **Step 10** | System separates categories | Structured AI Response | System explicitly separates **Recorded Facts**, **Trends**, **AI Observations**, **Missing Info**, **Evidence**, and **Safety Warnings**. |
| **Step 11** | System generates Doctor Brief | Doctor Brief Tab | Click "Generate Doctor Brief" to synthesize a 1-page clinical pre-visit brief. |
| **Step 12** | User creates controlled sharing | Sharing Controls Tab | Click "Generate Doctor Share Link" with 7-day expiration and PIN protection. |
| **Step 13** | User selects a timeframe | Timeframe Selector | Selects active 7-day share window for Dr. Sarah Jenkins. |
| **Step 14** | User revokes access | Revoke Access Button | Clicks "Revoke Access Now" to immediately terminate share token access. |

---

## How to Run Demo Mode

### 1. Prerequisites
- Node.js v18+ and npm
- Python 3.11+

### 2. Backend Startup
```bash
# From repository root
python -c "import sys; sys.path.append('backend'); import uvicorn; uvicorn.run('app.main:app', host='0.0.0.0', port=8000)"
```
- Swagger API Docs: `http://localhost:8000/docs`
- Health Check: `http://localhost:8000/health`

### 3. Frontend Startup
```bash
# From repository root
cmd /c npm run dev
```
- Open browser at: `http://localhost:5173`

### 4. Verification
The application opens directly into the pre-loaded synthetic profile for *Alex Rivera*, displaying the `SYNTHETIC DEMONSTRATION DATA` header badge.
