# MedTrace AI — Validation Data Dictionary

## Overview
This data dictionary defines all metrics, variable schemas, status codes, safety classes, evidence levels, and severity ratings used across the **MedTrace AI** validation execution suite.

---

## 1. Evidence Hierarchy Levels (`evidence_level`)

| Code Value | Label | Definition & Source Criteria |
|---|---|---|
| `LEVEL_0` | **Level 0: Internal Assumption** | Untested hypothesis or unverified team belief. |
| `LEVEL_1` | **Level 1: Founder / Team Opinion** | Internal team heuristic or expert intuition without external validation data. |
| `LEVEL_2` | **Level 2: Technical Implementation Evidence** | Empirical evidence from verified backend source code, ORM schemas, and passing automated unit tests. |
| `LEVEL_3` | **Level 3: Controlled Synthetic Testing** | Empirical benchmark data from automated evaluation suites running against synthetic non-PHI datasets. |
| `LEVEL_4` | **Level 4: Real User Validation** | Empirical qualitative/quantitative data from individual real user/physician research sessions. |
| `LEVEL_5` | **Level 5: Repeated Real-World Validation** | Multi-cohort empirical evidence gathered across repeated validation sessions or pilot trials. |

---

## 2. Issue Severity Tiers (`issue_severity`)

| Code Value | Label | Operational Definition |
|---|---|---|
| `CRITICAL` | **Critical Severity** | Serious safety, privacy, security, or diagnostic misinterpretation risk requiring immediate fix. |
| `HIGH` | **High Severity** | Issue significantly degrading product usability, clinical trust, physician workflow, or pilot adoption. |
| `MEDIUM` | **Medium Severity** | Meaningful friction or copy confusion where a straightforward workaround exists. |
| `LOW` | **Low Severity** | Minor visual, alignment, or copy polish suggestion. |

---

## 3. Safety Gatekeeper Categories (`safety_category`)

Defined in `backend/app/safety/safety_categories.py`:

| Code Value | String Label | Operational Action & Trigger Criteria |
|---|---|---|
| `SAFE` | `"SAFE"` | Standard decision-support query with grounded evidence. Returns informational summary. |
| `NEEDS_CLARIFICATION` | `"NEEDS CLARIFICATION"` | Missing lab units, impossible values, or vague symptom timelines. Prompts user for missing details. |
| `PROFESSIONAL_REVIEW` | `"PROFESSIONAL REVIEW RECOMMENDED"` | Active medication lists, eGFR trend drops, or drug interactions. Highlights finding for doctor review. |
| `URGENT_EMERGENCY` | `"URGENT MEDICAL ATTENTION"` | Acute red-flag emergency symptoms (chest pain, stroke). Triggers immediate static 911 / ER redirect modal. |
| `UNSAFE_REFUSE` | `"UNSAFE / MUST REFUSE"` | Prescriptive demands, unverified diagnostic demands, or prompt injection. Refuses request with boundary statement. |

---

## 4. Quantitative Scorecard Dimensions (`scorecard_dimension`)

Evaluated on a 1-to-5 Likert scale:

| Variable Identifier | Dimension Name | Evaluation Focus |
|---|---|---|
| `score_first_impression` | First Impression | Visual appeal, clarity of dark mode glassmorphism theme, synthetic badge awareness. |
| `score_product_comprehension` | Product Comprehension | Unassisted understanding that platform is an informational tool, not an AI doctor. |
| `score_navigation` | Navigation & Usability | Ease of switching tabs, scrolling timeline, and inspecting lab trend graphs. |
| `score_timeline` | Timeline Understanding | Comprehension of multi-year merged event trajectory (visits, labs, symptoms, meds). |
| `score_change_detection` | Change Detection | Ability to spot biomarker shifts (eGFR drop) and self-logged OTC drug additions. |
| `score_lab_intelligence` | Lab Intelligence | Interpretation of biomarker trend charts, reference ranges, and abnormal tags. |
| `score_medications` | Medication Intelligence | Ability to distinguish active prescriptions from OTC items and drug interaction flags. |
| `score_info_gaps` | Information Gap Engine | Perceived utility of surfaced missing baseline lab panels (uACR) for doctor visits. |
| `score_blind_spots` | Medical Blind Spots | Understanding flagged trend alerts as context gaps rather than AI diagnoses. |
| `score_evidence` | RAG Evidence | Comprehension of supporting literature citation cards and DOI/PMID links. |
| `score_safety_boundary` | Safety Boundaries | Perception that system refrains from prescribing, diagnosing, or autonomous commands. |
| `score_doctor_brief` | Doctor Brief Utility | Perceived utility of 1-page pre-visit summary for patient prep and physician review. |
| `score_sharing_controls` | Controlled Sharing | Comprehension of time-bounded 7-day share pass links and instant revocation. |
| `score_privacy_confidence` | Privacy Confidence | Comfort with zero-trust data isolation and anonymized patient data model. |
| `score_overall_value` | Overall Product Value | Overall assessment of whether MedTrace AI solves a meaningful healthcare problem. |

---

## 5. Share Grant Status Codes (`grant_status`)

| Code Value | UI Badge | Definition |
|---|---|---|
| `ACTIVE` | `badge-normal` | Share link is currently active, PIN-protected, and within valid timeframe window. |
| `EXPIRED` | `badge-warning` | Share link timeframe duration (e.g., 7 days) has elapsed automatically. |
| `REVOKED` | `badge-urgent` | Patient explicitly clicked "Revoke Access Immediately", terminating access across all sessions. |
