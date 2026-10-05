#!/bin/bash
set -e
echo "Restoring MedTrace AI..."

echo "1. Restoring PostgreSQL Database..."
docker-compose exec -T postgres_db psql -U postgres -d medtrace_db < backup_postgres.sql

echo "2. Restoring Qdrant Vector Database..."
# We run curl from the host or use docker run with a volume, OR copy the file in first!
docker cp backup_qdrant.snapshot medtrace_qdrant:/tmp/backup_qdrant.snapshot
docker-compose exec -T vector_db curl -s -X POST "http://localhost:6333/collections/medical_guidelines/snapshots/upload?priority=snapshot" \
  -H "Content-Type: multipart/form-data" \
  -F "snapshot=@/tmp/backup_qdrant.snapshot"
docker-compose exec -T vector_db rm /tmp/backup_qdrant.snapshot

echo "Restore completed successfully!"
