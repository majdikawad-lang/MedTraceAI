# MedTrace AI — Physician & Clinician Interview Guide

## Protocol Overview
- **Target Audience:** Practicing Primary Care Physicians (PCPs), Internists, Endocrinologists, and Nurse Practitioners.
- **Interviewer Stance:** Neutral, objective, clinical peer inquiry. Avoid selling, defending, or leading.
- **Session Duration:** 45–60 Minutes.

---

## 1. Current Clinical Workflow Inquiry (10 Mins)
*Goal: Understand how the physician currently absorbs patient history during rushed consultations.*

- *"When a patient arrives with a complex 2-year history across multiple outside facilities, how do you currently review their longitudinal trajectory?"*
- *"What specific historical information (e.g., eGFR slope, medication additions, outside lab dates) is hardest or most time-consuming to reconstruct?"*
- *"In a typical 15-minute consultation, how much time can you realistically spend reviewing historical EHR records?"*
- *"What critical information is most frequently missing when you see a patient for the first time?"*

---

## 2. Product Architecture & Display Evaluation (15 Mins)
*Goal: Evaluate clinician reactions to the interactive synthetic profile (Alex Rivera).*

- **Show Timeline & Lab Trends:**  
  - *"Looking at this longitudinal timeline and lab trend graph (eGFR drop from 84 to 58), what information stands out to you immediately?"*
  - *"What part of this display is clinically useful? What part feels unnecessary or redundant?"*
  - *"How does graphing biomarker trends alongside self-reported medication changes (e.g., OTC Ibuprofen) impact your clinical assessment?"*

---

## 3. Deep-Dive: Doctor Brief Evaluation (15 Mins)
*Goal: Stress-test the 1-page pre-visit Doctor Brief artifact.*

- **Show Generated Doctor Brief:**  
  - *"Here is an AI-generated 1-page Doctor Brief compiled before the visit. Scanning this for 30 seconds, what is your initial impression?"*
  - *"What specific items in this brief would you find genuinely useful in your pre-visit review?"*
  - *"What items in this brief would you want REMOVED because they are distracting, unhelpful, or low-priority?"*
  - *"What critical information is MISSING that you would want ADDED to this brief?"*
  - *"What specific statement or formatting would cause you to DISTRUST this brief during a busy clinic day?"*
  - *"Which specific data points in this summary would you feel obligated to verify manually in the raw chart before making a decision?"*

---

## 4. Clinical Safety, Risk & Uncertainty (10 Mins)
*Goal: Identify potential cognitive pitfalls and automation risks.*

- *"Where do you see potential risk for a physician misinterpreting an AI-summarized trend or medication discrepancy?"*
- *"How effectively does the system communicate clinical uncertainty (e.g., missing baseline uACR tests or unconfirmed OTC dosages)?"*
- *"What explicit safety disclaimers or visual indicators are necessary to ensure the brief remains an informational decision-support tool rather than an automated direction?"*

---

## 5. Practice Adoption & Technical Requirements (5 Mins)
*Goal: Understand integration and security hurdles for real clinical settings.*

- *"What operational or technical barriers would prevent your practice from using a pre-visit summary tool like this?"*
- *"What specific EHR integrations (e.g., Epic Hyperspace, Cerner, AthenaHealth) would be mandatory before considering a clinical pilot?"*
- *"What security, privacy, or compliance assurances (e.g., HIPAA BAAs, SOC 2) would your health system require?"*

---

## 6. Commercial & Business Model Discovery (5 Mins)
*Goal: Identify potential payment models without leading.*

- *"In your opinion, who in the healthcare ecosystem would derive the most financial or operational value from a tool like MedTrace AI?"*
- *"Who do you believe should pay for a platform like this?"*
  - *Probe neutrally: The patient, the outpatient clinic, the hospital health system, the employer, or the health insurance payer?*
- *"What would make a clinical pilot worth trying in your practice?"*
