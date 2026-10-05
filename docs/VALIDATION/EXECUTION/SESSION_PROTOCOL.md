# MedTrace AI — Master Session Protocol

## Protocol Overview
- **Session Duration:** 30–45 Minutes.
- **Target Participant Cohorts:** General Users / Patients, Physicians, Technical Reviewers, B2B Clinic Decision-Makers.
- **Facilitator Rule:** Do **not** explain the product features in detail before testing initial comprehension. Let the participant explore and interpret the UI naturally.

---

## 9-Phase Master Session Flow

```
┌────────────────────────────────────────────────────────────────────────┐
│                     9-PHASE MASTER SESSION FLOW                        │
├────────────────────────────────────────────────────────────────────────┤
│ Phase 1 (00–03 min) │ Welcoming Introduction & Neutral Stance          │
│ Phase 2 (03–05 min) │ Participant Agreement & Privacy Disclosure       │
│ Phase 3 (05–10 min) │ Pre-Test Background & Workflow Questions         │
│ Phase 4 (10–13 min) │ First Impression & Unassisted Comprehension      │
│ Phase 5 (13–30 min) │ Task-Based Usability & Scenario Execution       │
│ Phase 6 (30–35 min) │ Empirical Facilitator Observation Capture       │
│ Phase 7 (35–40 min) │ Post-Task Follow-Up & Deep-Dive Inquiry         │
│ Phase 8 (40–43 min) │ Session Scorecard Completion                     │
│ Phase 9 (43–45 min) │ Final Participant Feedback & Wrap-Up             │
└────────────────────────────────────────────────────────────────────────┘
```

---

## Phase-by-Phase Instructions

### Phase 1: Introduction (00:00 – 00:03)
- **Facilitator Script:**
  > “Thank you for participating today. We are researching how people and healthcare professionals manage and review medical information over time. We are testing a prototype called MedTrace AI. I did not design this app, so please be completely honest. You cannot hurt my feelings, and negative feedback is often the most helpful for our research.”

---

### Phase 2: Participation Agreement & Privacy (00:03 – 00:05)
- Explain that session observations and non-PII notes are recorded for research purposes.
- Reassure participant: *"We will use synthetic demonstration data for a fake patient named Alex Rivera. No real patient data is used or stored."*

---

### Phase 3: Background Questions (00:05 – 00:10)
- Ask unprompted questions about current habits for managing health history or preparing for appointments (see cohort-specific session guides).

---

### Phase 4: Product Explanation & Initial Comprehension (00:10 – 00:13)
- Open `http://localhost:5173` to Alex Rivera synthetic profile.
- **Do NOT explain the features.** Ask: *"Looking at this screen for the first time, what do you think this product is designed to do?"*

---

### Phase 5: Task-Based Testing (00:13 – 00:30)
- Hand participant task cards (see [`TASK_CARDS.md`](file:///c:/Users/DELL/Desktop/MedTrace_AI/docs/VALIDATION/EXECUTION/TASK_CARDS.md)).
- Ask participant to think aloud while executing tasks. Facilitator remains silent unless completely blocked.

---

### Phase 6: Observation Capture (00:30 – 00:35)
- Facilitator records task completion, errors, confusion points, verbatim quotes, and safety reactions on [`OBSERVATION_SHEET.md`](file:///c:/Users/DELL/Desktop/MedTrace_AI/docs/VALIDATION/EXECUTION/OBSERVATION_SHEET.md).

---

### Phase 7: Follow-up Questions (00:35 – 00:40)
- Probe on specific moments of hesitation, trust factors, Doctor Brief utility, or safety boundary interpretations.

---

### Phase 8: Scorecard Completion (00:40 – 00:43)
- Complete numerical 1–5 scoring on [`SESSION_SCORECARD.md`](file:///c:/Users/DELL/Desktop/MedTrace_AI/docs/VALIDATION/EXECUTION/SESSION_SCORECARD.md) with qualitative notes.

---

### Phase 9: Final Feedback & Wrap-Up (00:43 – 00:45)
- Ask final open-ended questions: *"What was most useful? What was least useful? What would stop you from using this?"* Thank participant and close session.
