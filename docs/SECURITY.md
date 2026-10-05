# MedTrace AI — Security Infrastructure & Compliance Controls

## 1. Implemented Security Controls

MedTrace AI incorporates technical security safeguards across all system tiers:

```
┌────────────────────────────────────────────────────────────────────────┐
│                        IMPLEMENTED CONTROLS                            │
├────────────────────────────────────────────────────────────────────────┤
│ 1. Authentication        │ OAuth2 Password Bearer Flow with Bcrypt     │
│ 2. Authorization         │ JWT HS256 Signed Access Tokens                 │
│ 3. Data Isolation        │ Zero-Trust IDOR/BOLA Scoping (`patient_id`)    │
│ 4. Audit Logging         │ Immutable SHA-256 Hash-Signed Audit Logs       │
│ 5. Controlled Sharing    │ Time-bounded, PIN-protected share tokens       │
│ 6. Injection Defense     │ XML Tag Isolation & Delimiter Neutralization   │
│ 7. Secrets Management    │ Environment variable isolation (`.env`)        │
└────────────────────────────────────────────────────────────────────────┘
```

---

## 2. Detailed Technical Control Descriptions

### A. Authentication & Password Hashing
- **Algorithm:** Password hashing using `Bcrypt` via `passlib.context.CryptContext` with salt rounds configured.
- **Session Tokens:** Stateless OAuth2 JSON Web Tokens (JWT) signed with `HS256` secret key, containing expiration (`exp`) and subject (`sub`) claims.

### B. Multi-Tenant Patient Data Isolation (IDOR / BOLA Defense)
- **Zero-Trust Patient Scoping:** Every REST API controller extracts the authenticated `user_id` from the JWT and enforces strict patient record ownership checks:
  ```python
  if patient.user_id != current_user.id:
      raise HTTPException(status_code=404, detail="Patient profile not found")
  ```
- **BOLA Protection:** Verified 100% path parameter isolation across all patient, lab, medication, symptom, and timeline endpoints in backend integration tests.

### C. Cryptographic Audit Logging (`AuditLogger`)
- **Immutable Transaction Records:** Every sensitive action (login, medical record access, brief generation, share link creation, revocation) emits an audit log event.
- **SHA-256 Signature Chaining:** Each log record generates a SHA-256 cryptographic signature computed over:
  `SHA-256(user_id + ":" + action + ":" + resource_id + ":" + timestamp + ":" + previous_hash)`
- **Tamper Evident:** Modifying any historical log record invalidates downstream chain signatures.

### D. Controlled Sharing & Instant Revocation
- **Time-Bounded Access:** Share links expire automatically after user-configured durations (1 hour to 30 days; default 7 days).
- **PIN Verification:** Access requires a 4-digit PIN set during share creation.
- **Instant Revocation:** Patients can toggle `is_active = False` at any time, instantly invalidating access across all sessions.

### E. Prompt-Injection Defense
- **Untrusted Content Encapsulation:** Patient-uploaded notes and PDF parser outputs are isolated inside `<untrusted_user_document_content>` tags.
- **Tag Neutralization:** Brackets and closing tags are HTML-entity encoded prior to model prompt formatting to prevent prompt breakout attacks.

---

## 3. Future Production Requirements (Not Yet Implemented)

To transition from the current MVP Release Candidate (`v0.1.0-mvp-rc`) to a production clinical environment, the following additional infrastructure controls must be implemented:

- **Database-Level Row-Level Security (RLS):** Enforce RLS policies directly in PostgreSQL engine.
- **Hardware Security Module (HSM) / KMS:** Cloud Key Management Service for JWT secret key rotation.
- **Formal SOC 2 Type II Auditing:** Independent third-party audit across Security and Confidentiality criteria.
- **Executed Business Associate Agreements (BAAs):** Formal BAAs signed with cloud hosting and LLM infrastructure vendors.
- **Automated Dependency Vulnerability Scanning:** Snyk / Trivy CI pipeline integration.

---

## 4. Formal Regulatory & Compliance Disclaimer

> [!WARNING]
> **No Formal Compliance Certification Claim**  
> MedTrace AI implements technical safeguards aligned with HIPAA Security Rule guidelines and GDPR principles, but **has NOT undergone formal HIPAA certification, SOC 2 audit, or regulatory clearance (FDA SaMD / CE Mark)**. The platform is strictly presented in the Controlled MVP Demonstration / Validation Stage.
