# MedTrace AI — Patient & General User Session Script

## Session Specifications
- **Target Participant:** Patients managing chronic conditions, multi-specialist care, or family caregivers.
- **Session Duration:** 30–45 Minutes.
- **Data Boundary:** Synthetic profile for **Alex Rivera** (ID: `pt_984102`). Zero real PHI used.

---

## 12-Phase Operational Session Script

### Phase 1 — Background Inquiry
*Facilitator Prompt (Unprompted & Non-Leading):*
- *"How do you currently keep track of your medical history across different doctors or clinic portals?"*
- *"What is difficult about finding old medical records when you need them?"*
- *"What do you normally prepare before going to a doctor's appointment?"*
- *"What health or medical information do you usually forget to mention during visits?"*

---

### Phase 2 — First Impression & Comprehension
*Action:* Open `http://localhost:5173`. Show Overview tab without explaining features.
*Facilitator Prompt:*
- *"What do you think this product does?"*
- *"What do you think you can do on this screen?"*
- *"What health information do you think this system is using?"*
*Record exact response verbatim on [`OBSERVATION_SHEET.md`](file:///c:/Users/DELL/Desktop/MedTrace_AI/docs/VALIDATION/EXECUTION/OBSERVATION_SHEET.md).*

---

### Phase 3 — Medical Timeline Task
*Task Prompt:*
- *"Please explore this patient's medical history on screen and tell me what you think happened to him over time."*
*Facilitator Guidelines:*
- Observe navigation, scrolling, and event filtering.
- Do NOT help unless the participant is completely blocked for 30+ seconds.
- Record whether participant identified key events (routine physical in 2024, knee stiffness, ankle swelling in 2026).

---

### Phase 4 — What Changed? Task
*Task Prompt:*
- *"Can you identify anything specific that appears to have changed over time for this patient?"*
*Record:*
- What changes were noticed naturally (e.g., eGFR decrease, HbA1c rise, OTC Ibuprofen addition).
- What changes were missed.
- Whether biomarker trend graphs were understood.

---

### Phase 5 — Lab Intelligence Task
*Task Prompt:*
- *"Please review the laboratory section and tell me what you think this screen is communicating."*
*Rule:* Do NOT ask *"Is this useful?"* until AFTER the participant explains their interpretation.

---

### Phase 6 — Information Gap Task
*Task Prompt:*
- *"Look through the Information Gap section and tell me whether anything appears to be missing or unclear in this patient's records."*
*Record:*
- Does participant understand missing baseline tests (uACR)?
- Does participant understand missing lab units or dates?

---

### Phase 7 — Medical Blind Spots Task
*Task Prompt:*
- *"What do you think the section titled 'Medical Blind Spots' means?"*
*CRITICAL OBSERVATION:*
- Does participant interpret it as:  
  **A.** Information or lab trends that may be missing/unreviewed (Correct decision-support interpretation)  
  **B.** An automated AI diagnosis of disease (Incorrect diagnostic interpretation)  
*Record exact distinction carefully.*

---

### Phase 8 — AI Question Task
*Task Prompt:*
- *"You can type a question about this patient's history in the RAG Evidence tab. What would you like to ask?"*
*Record:*
- Question type submitted.
- Comprehension of retrieved evidence citations.
- Perception of clinical uncertainty.

---

### Phase 9 — Controlled Safety Test
*Task Prompt (Controlled Synthetic Scenario):*
- *"Imagine you type: 'Should I stop taking Lisinopril starting tomorrow?' Watch what the app displays."*
*Observe:*
- Does participant understand why the system categorized the request as `UNSAFE / MUST REFUSE`?
- Does participant understand the refusal statement directing them to consult a physician?

---

### Phase 10 — Doctor Brief Review
*Task Prompt:*
- *"Click 'Generate Doctor Brief'. Looking at this generated 1-page summary, what do you think this document is for?"*
- *"Who do you think would use a document like this?"*

---

### Phase 11 — Controlled Sharing Review
*Task Prompt:*
- *"Look at the Sharing Controls tab and explain to me: what is being shared, who receives access, how long access lasts, and how access can be revoked."*
*Rule:* Do NOT provide answers until participant's interpretation is recorded.

---

### Phase 12 — Final Wrap-Up Questions
*Facilitator Prompts:*
- *"What was the most useful part of this app?"*
- *"What was the least useful part?"*
- *"What confused you?"*
- *"What made you trust the information?"*
- *"What made you hesitate?"*
- *"What would stop you from using something like this?"*
- *"What would make you use it regularly?"*
- *"What would you expect to pay for a tool like this (e.g., free app, monthly subscription, paid by clinic)?"*
