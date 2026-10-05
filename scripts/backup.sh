#!/bin/bash
set -e
echo "Backing up MedTrace AI..."

echo "1. Backing up PostgreSQL Database..."
docker-compose exec -T postgres_db pg_dump -U postgres medtrace_db > backup_postgres.sql

echo "2. Backing up Qdrant Vector Database..."
# Request a snapshot for the medical_guidelines collection
docker-compose exec -T vector_db curl -s -X POST "http://localhost:6333/collections/medical_guidelines/snapshots"
# Get the name of the latest snapshot
SNAPSHOT_FILE=$(docker-compose exec -T vector_db sh -c "ls -t /qdrant/snapshots/medical_guidelines | head -n 1")
docker cp medtrace_qdrant:/qdrant/snapshots/medical_guidelines/$SNAPSHOT_FILE ./backup_qdrant.snapshot

echo "Backup completed successfully!"
