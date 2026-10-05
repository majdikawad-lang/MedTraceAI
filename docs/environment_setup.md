# MEDTRACE AI — Environment Setup Guide

## 1. Prerequisites
- Docker & Docker Compose (v2.20+) OR
- Python 3.11+ & Node.js 18+

## 2. Environment Variables (.env)
Copy `.env.example` to `.env`:
```bash
cp .env.example .env
```

Key variables:
- `SECRET_KEY`: Minimum 32-character secret key for JWT signing.
- `DATABASE_URL`: PostgreSQL connection string (`postgresql://medtrace_user:medtrace_secure_password@localhost:5432/medtrace_db`).
- `DEFAULT_LLM_PROVIDER`: Set to `mock`, `anthropic`, `google_gemini`, or `openai`.
- `VECTOR_STORE_PROVIDER`: Set to `pgvector` or `mock`.

## 3. Running with Docker Compose
```bash
docker-compose -f infrastructure/docker-compose.yml up --build
```
