#!/bin/bash
set -e
echo "1. Backing up PostgreSQL Database..."
docker exec medtrace_postgres pg_dump -U medtrace_user medtrace_db > backup_postgres.sql

echo "2. Backing up Qdrant Vector Database..."
docker exec medtrace_qdrant curl -s -X POST "http://localhost:6333/collections/clinical_notes/snapshots"
SNAPSHOT_FILE=$(docker exec medtrace_qdrant sh -c "ls -t /qdrant/snapshots/clinical_notes | head -n 1")
docker cp medtrace_qdrant:/qdrant/snapshots/clinical_notes/$SNAPSHOT_FILE ./backup_qdrant.snapshot
echo "Backup completed successfully!"
