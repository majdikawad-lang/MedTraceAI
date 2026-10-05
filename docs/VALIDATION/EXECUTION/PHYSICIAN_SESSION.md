# MedTrace AI — Physician & Clinician Session Script

## Session Specifications
- **Target Participant:** Practicing PCPs, Internists, Endocrinologists, and Nurse Practitioners.
- **Session Duration:** 30–45 Minutes.
- **Data Boundary:** Synthetic profile for **Alex Rivera** (ID: `pt_984102`). Zero real PHI used.

---

## Operational Session Script & Deep-Dive Protocol

### 1. Current Clinical Workflow & Pain Points (8 Mins)
- *"When seeing a new patient with a 2-year history across multiple outside facilities, how do you currently reconstruct their longitudinal trajectory?"*
- *"In a standard 15-minute consultation, how much time do you spend reviewing past records versus talking to the patient?"*
- *"What specific historical information (e.g., eGFR drop slope, OTC drug additions) is hardest to find or most commonly missing?"*
- *"What takes the most cognitive effort during pre-visit chart review?"*

---

### 2. Longitudinal Timeline & Trend Evaluation (10 Mins)
- **Show Timeline & Lab Trends (Alex Rivera Profile):**
  - *"Scanning this timeline and biomarker graph (eGFR drop from 84 to 58 mL/min/1.73m² alongside OTC Ibuprofen addition), what is your immediate clinical reaction?"*
  - *"Does graphing biomarker trends alongside self-reported medication changes help you spot relevant clinical shifts faster?"*
  - *"What information on this screen is unnecessary or redundant for a physician?"*

---

### 3. Doctor Brief Deep-Dive Evaluation (15 Mins)
- **Show Generated 1-Page Doctor Brief:**  
  - *"Imagine receiving this 1-page Doctor Brief 60 seconds before entering the exam room. What is your initial assessment?"*
  - *"Which specific sections would you find genuinely useful in your pre-visit routine?"*
  - *"What specific data points would you feel compelled to VERIFY in the raw chart before acting on them?"*
  - *"What information would you REMOVE from this brief because it is distracting or low-priority?"*
  - *"What critical information is MISSING that should be added?"*
  - *"What formatting or statement would cause you to DISTRUST this brief?"*
  - *"What would make this brief clinically distracting versus genuinely useful?"*

---

### 4. System Trust, Evidence & Safety Boundaries (7 Mins)
- *"What level of trust would you place in an automatically generated clinical summary?"*
- *"When you see explicit literature citation links (e.g., KDIGO 2024 guidelines or FDA prescribing labels), how does that impact your trust?"*
- *"What warning indicators or uncertainty callouts are necessary to ensure safety?"*
- *"What would cause you to completely reject an AI pre-visit brief?"*

---

### 5. Workflow Integration & Pilot Adoption Prerequisites (5 Mins)
- *"Where could a tool like MedTrace AI fit into your existing clinical workflow (e.g., patient home prep, medical assistant check-in, or physician pre-review)?"*
- *"At what exact point in your day would you want to see this summary?"*
- *"What technical or security prerequisites (e.g., Epic/Cerner FHIR integration, HIPAA BAAs, SOC 2) would your health system require before a clinical pilot?"*
