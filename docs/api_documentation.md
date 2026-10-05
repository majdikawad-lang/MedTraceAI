# MEDTRACE AI — API Documentation (v1 REST)

## Base URL
`http://localhost:8000/api/v1`

---

## Endpoints Summary

### 1. Health
- **`GET /health`**  
  Returns system operational status and provider settings.

### 2. Authentication
- **`POST /auth/register`**  
  *Payload:* `{ "email", "password", "name", "date_of_birth", "biological_sex" }`  
  *Response:* `{ "access_token", "token_type", "expires_in_seconds" }` (HTTP 201 Created).

- **`POST /auth/login`**  
  *Payload:* `{ "email", "password" }`  
  *Response:* `{ "access_token", "token_type", "expires_in_seconds" }`.

- **`GET /auth/me`**  
  *Headers:* `Authorization: Bearer <token>`  
  *Response:* User details object.

### 3. Patient Profile
- **`GET /patient/profile`**  
  *Headers:* `Authorization: Bearer <token>`  
  *Response:* PatientProfile object containing demographic data, physician info, known conditions, and allergies.

### 4. Safety & Red-Flag Gatekeeper
- **`POST /safety/triage`**  
  *Payload:* `{ "user_input": "text..." }`  
  *Response:* `{ "is_emergency", "requires_disclaimer", "flag_level", "trigger_words", "message", "action_guidance" }`.
