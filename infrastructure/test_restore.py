import requests
import json
import os
import subprocess
import time

BASE_URL = os.getenv("STAGING_BASE_URL", "http://localhost:8000/api/v1")
with open("../staging_data.json", "r") as f:
    data = json.load(f)

print("1. Performing Backup...")
subprocess.run("docker exec medtrace_postgres pg_dump -U medtrace_admin -d medtrace_clinical -F c > backup_staging.dump", shell=True, check=True)
size = os.path.getsize("backup_staging.dump")
print(f"Backup created: backup_staging.dump, Size: {size} bytes")

print("2. Destroying DB...")
subprocess.run("docker-compose stop postgres_db backend frontend", shell=True, check=True)
subprocess.run("docker-compose rm -f -v postgres_db", shell=True, check=True)
subprocess.run("docker volume rm infrastructure_postgres_data", shell=True, check=True)
subprocess.run("docker-compose up -d postgres_db", shell=True, check=True)
print("Waiting for Postgres to be ready...")
time.sleep(15) 

print("3. Restoring Backup...")
# pg_restore returns warnings, so check=False
subprocess.run("docker exec -i medtrace_postgres pg_restore -U medtrace_admin -d medtrace_clinical --clean < backup_staging.dump", shell=True, check=False)

print("4. Restarting Backend & Frontend...")
subprocess.run("docker-compose up -d backend frontend", shell=True, check=True)
time.sleep(15)

print("5. Verifying Data and Isolation...")
headers_a = {"Authorization": f"Bearer {data['tenant_a_token']}"}
headers_b = {"Authorization": f"Bearer {data['tenant_b_token']}"}

for _ in range(5):
    try:
        r = requests.get(f"{BASE_URL}/patient/list", headers=headers_a)
        if r.status_code == 200: break
    except: pass
    time.sleep(1)

assert r.status_code == 200, f"Failed: {r.text}"
assert len(r.json()) > 0
print("Tenant A verified.")

r = requests.get(f"{BASE_URL}/patient/profile?patient_id={data['patient_a_id']}", headers=headers_b)
assert r.status_code == 404
print("Cross-tenant blocked.")

r = requests.get(f"{BASE_URL}/audit/", headers=headers_a)
assert r.status_code == 200
assert len(r.json()) > 0
print("Audit Events verified.")

print("BACKUP AND RESTORE WORKFLOW SUCCESSFUL")
