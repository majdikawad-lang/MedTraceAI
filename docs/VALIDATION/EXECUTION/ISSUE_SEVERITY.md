# MedTrace AI — Issue Severity Taxonomy & Classification Guide

## Overview
This taxonomy defines four standardized severity tiers for categorizing usability, trust, safety, privacy, and clinical workflow issues identified during validation testing.

---

## 4-Tier Severity Classification Matrix

```
┌────────────────────────────────────────────────────────────────────────┐
│                       ISSUE SEVERITY MATRIX                            │
├────────────────────────────────────────────────────────────────────────┤
│ CRITICAL │ Serious safety, privacy, security, or diagnostic risk.     │
│ HIGH     │ Significantly impairs usability, trust, or clinical fit.   │
│ MEDIUM   │ Meaningful friction or confusion, but workaround exists.    │
│ LOW      │ Minor visual, cosmetic, or minor copy polish issue.        │
└────────────────────────────────────────────────────────────────────────┘
```

---

## Tier Definitions & Concrete Examples

### 1. CRITICAL SEVERITY
- **Definition:** An issue that introduces serious medical safety risk, privacy breach, security vulnerability, or causes a participant to interpret MedTrace AI as issuing a binding medical diagnosis or automated prescription modification.
- **Concrete Examples:**
  - *Example A (Diagnostic Misinterpretation):* Participant interprets a "Medical Blind Spot" warning as an automated AI diagnosis of end-stage kidney failure and decides to skip prescribed medications without consulting a physician.
  - *Example B (Safety Gate Failure):* Safety engine fails to refuse a prescriptive query (*"Can I double my dose of Metformin?"*) and outputs dosage advice.
  - *Example C (Security Defect):* Authorization bypass allowing a user to access another patient's profile (`IDOR/BOLA` failure).

---

### 2. HIGH SEVERITY
- **Definition:** An issue that significantly impairs core usability, severely degrades clinical trust, creates substantial physician workflow friction, or presents a major barrier to adoption.
- **Concrete Examples:**
  - *Example A (Doctor Brief Friction):* Physician reports that the generated Doctor Brief contains too much low-priority demographic text, making it impossible to read within 60 seconds.
  - *Example B (Graph Misinterpretation):* Patient misreads the eGFR slope axis and believes their kidney function dropped to 0.
  - *Example C (Citation Distrust):* Clinician inspects a literature citation card and finds the DOI link points to an broken or irrelevant article.

---

### 3. MEDIUM SEVERITY
- **Definition:** A meaningful usability friction point or copy ambiguity that causes temporary participant confusion, but where a straightforward workaround exists or the user recovers independently.
- **Concrete Examples:**
  - *Example A (Terminology Confusion):* Patient misinterprets the term "Information Gap" as an unpaid medical bill, but realizes its meaning upon reading the subtext question.
  - *Example B (Filter Inconvenience):* User has difficulty finding how to filter timeline events by category (e.g. Laboratory vs Symptoms).
  - *Example C (Share Link Expiration):* User is unsure whether a 7-day share link expires at midnight or 24 hours after creation.

---

### 4. LOW SEVERITY
- **Definition:** Minor visual, alignment, formatting, or minor copy polish issues that do not impede task completion, safety, or product comprehension.
- **Concrete Examples:**
  - *Example A (Layout Polish):* A badge border line is misaligned by 2 pixels on mobile screen widths.
  - *Example B (Typo):* A minor grammatical typo in a non-clinical instruction sentence.
  - *Example C (Icon Choice):* Participant suggests using a different icon for the Audit tab.
