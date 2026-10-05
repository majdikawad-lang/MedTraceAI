# MedTrace AI — Product & Market Assumptions Inventory

## Overview
This document logs all foundational assumptions regarding user pain, product utility, clinical workflow fit, trust, and business models for **MedTrace AI**. 

> [!IMPORTANT]
> **UNTESTED ASSUMPTION PRINCIPLE**  
> Every assumption in this inventory is explicitly classified as **`UNTESTED`** until empirical real-world validation evidence (Level 4 or Level 5) is gathered. No assumption is marked as "validated" without documented interview data.

---

## Master Assumptions Inventory

```
┌────────────────────────────────────────────────────────────────────────┐
│                        ASSUMPTIONS INVENTORY                           │
├────────────────────────────────────────────────────────────────────────┤
│ ID        │ Assumption Statement                         │ Status      │
├───────────┼──────────────────────────────────────────────┼─────────────┤
│ A-PAIN-01 │ Patients experience significant cognitive    │ UNTESTED    │
│           │ stress managing fragmented records.          │             │
│ A-PAIN-02 │ Physicians lack time to reconstruct 2-year   │ UNTESTED    │
│           │ longitudinal trends during 15-min visits.    │             │
│ A-PROD-01 │ Users value an interactive timeline over     │ UNTESTED    │
│           │ static PDF document lists.                   │             │
│ A-PROD-02 │ Users easily understand the distinction      │ UNTESTED    │
│           │ between decision support and diagnosis.      │             │
│ A-CLIN-01 │ Physicians will trust a 1-page Doctor Brief  │ UNTESTED    │
│           │ compiled by an AI RAG engine.                │             │
│ A-CLIN-02 │ Highlighting Information Gaps (e.g. uACR)    │ UNTESTED    │
│           │ improves appointment discussion quality.     │             │
│ A-PRIV-01 │ Patients care about time-bounded access      │ UNTESTED    │
│           │ link controls and instant revocation.        │             │
│ A-BIZ-01  │ B2C users have willingness to pay $9.99/mo   │ UNTESTED    │
│           │ for longitudinal trend tracking.             │             │
│ A-BIZ-02  │ Outpatient clinics will pay for pre-visit    │ UNTESTED    │
│           │ Doctor Brief tools to improve throughput.    │             │
└───────────┴──────────────────────────────────────────────┴─────────────┘
```

---

## Detailed Assumption Descriptions & Validation Target

### Pain Assumptions
- **A-PAIN-01 (Fragmented Record Stress):** *Patients with chronic conditions find managing records across multiple portals and lab facilities painful enough to seek a third-party software solution.*  
  - **Status:** `UNTESTED` | **Validation Target:** Patient Cohort Interview Protocol Section 1.
- **A-PAIN-02 (Physician Time Constraints):** *Physicians regularly miss subtle longitudinal shifts (e.g., eGFR drops) due to 15-minute appointment constraints.*  
  - **Status:** `UNTESTED` | **Validation Target:** Physician Cohort Interview Protocol Section 1.

### Product & Safety Assumptions
- **A-PROD-01 (Timeline Utility):** *A chronological timeline combining visits, symptoms, meds, and lab dates reduces user cognitive load compared to portal document folders.*  
  - **Status:** `UNTESTED` | **Validation Target:** Usability Protocol Steps 3–5.
- **A-PROD-02 (Non-Diagnostic Understanding):** *Users will not interpret MedTrace AI outputs as automated diagnostic mandates or prescription instructions.*  
  - **Status:** `UNTESTED` | **Validation Target:** Patient Interview Protocol Section 4 & Usability Step 11.

### Clinical & Trust Assumptions
- **A-CLIN-01 (Doctor Brief Trust):** *Physicians will find a 1-page pre-visit summary valuable if claims link directly to source records and literature citations.*  
  - **Status:** `UNTESTED` | **Validation Target:** Physician Interview Protocol Section 3.
- **A-CLIN-02 (Information Gap Utility):** *Surfacing unmeasured baseline laboratory parameters helps structure doctor-patient communication.*  
  - **Status:** `UNTESTED` | **Validation Target:** Physician Interview Protocol Section 3 & Usability Step 7.

### Privacy & Business Model Assumptions
- **A-PRIV-01 (Sharing Controls):** *Patients feel greater confidence when sharing records via time-bounded access passes with instant revocation.*  
  - **Status:** `UNTESTED` | **Validation Target:** Usability Protocol Steps 13–14.
- **A-BIZ-01 (B2C Willingness to Pay):** *Patients will pay a monthly subscription fee for longitudinal health second-brain management.*  
  - **Status:** `UNTESTED` | **Validation Target:** Patient Interview Protocol Section 6.
- **A-BIZ-02 (B2B Clinic Subscription):** *Primary care practices will pay a per-clinician monthly SaaS fee to integrate Doctor Briefs into pre-visit workflows.*  
  - **Status:** `UNTESTED` | **Validation Target:** Physician & Clinic B2B Interview Protocol Section 6.
