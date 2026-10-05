import uuid
import httpx
from app.core.database import SessionLocal
from app.models.tenant import TenantMembership
from app.models.user import User

API_URL = "http://localhost:8000/api/v1"
QDRANT_URL = "http://vector_db:6333"

def register_and_login(email):
    pw = "StrongPass123"
    register_payload = {
        "email": email, "password": pw, "name": "Test User",
        "date_of_birth": "1990-01-01", "biological_sex": "Male"
    }
    r = httpx.post(f"{API_URL}/auth/register", json=register_payload)
    if r.status_code != 201:
        print(f"Register failed: {r.text}")
    resp = httpx.post(f"{API_URL}/auth/login", json={"email": email, "password": pw})
    if "access_token" not in resp.json():
        print(f"Login failed: {resp.text}")
    return resp.json()["access_token"]
