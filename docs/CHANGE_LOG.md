# MedTrace AI — Change Log (`v0.1.0-mvp-rc`)

**Release Version:** `v0.1.0-mvp-rc`  
**Date:** September 11, 2026  

---

## 📝 Modification Log

### 1. `src/data/mockData.ts`
- **Reason**: Fix unescaped single-quote syntax error breaking TypeScript compilation (`St. John's Wort`).
- **Type**: Bug Fix / Frontend Build
- **Risk Level**: Low

### 2. `backend/app/safety/safety_categories.py`
- **Reason**: Fix unhandled `NameError` on `lab_trends` variable reference; refine conservative 5-tier classification logic.
- **Type**: Bug Fix / AI Safety
- **Risk Level**: Low

### 3. `backend/app/safety/prompt_injection.py`
- **Reason**: Expand prompt injection regex patterns and strengthen boundary tag neutralization.
- **Type**: Security / Prompt Injection Defense
- **Risk Level**: Low

### 4. `tests/red_team/test_adversarial_safety.py`
- **Reason**: Expand adversarial test suite to cover all 14 red-team attack scenarios including multi-tenant IDOR isolation.
- **Type**: Testing / Security Audit
- **Risk Level**: Low

### 5. `tests/evaluation/test_evaluation_runner.py`
- **Reason**: Create automated test runner for synthetic evaluation dataset benchmarks.
- **Type**: Testing / Evaluation
- **Risk Level**: Low

### 6. `src/App.tsx` & Frontend Components
- **Reason**: Fix CSS `justify` properties to `justifyContent`, clean unused imports, and integrate Doctor Portal ([`DoctorDashboardTab.tsx`](file:///c:/Users/DELL/Desktop/MedTrace_AI/src/components/DoctorDashboardTab.tsx)) and Controlled Sharing ([`SharingControlTab.tsx`](file:///c:/Users/DELL/Desktop/MedTrace_AI/src/components/SharingControlTab.tsx)).
- **Type**: Feature Integration / Code Quality
- **Risk Level**: Low

### 7. Documentation Suite (`README.md`, `docs/`)
- **Reason**: Update README and docs to accurately describe `v0.1.0-mvp-rc`, setup instructions, build instructions, test commands, safety boundaries, limitations, and future roadmap.
- **Type**: Documentation
- **Risk Level**: Low
