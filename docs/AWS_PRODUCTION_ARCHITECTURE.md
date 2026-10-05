# MedTrace AI - AWS Production Architecture (Refined Pre-Provisioning)

## 1. Qdrant Cloud Private Connectivity
**Connectivity Mechanism:** AWS PrivateLink via VPC Endpoint Service.
**Compatibility:** The MedTrace AI AWS VPC and the Qdrant Cloud Cluster MUST be deployed in the same AWS Region (e.g., `us-east-1`).
**Support Dependency:** PrivateLink is ONLY supported on Qdrant Cloud "Dedicated" tiers. If a lesser tier is chosen, this PrivateLink architecture is invalid. 
**Endpoint Architecture:** An AWS VPC Interface Endpoint is provisioned in the application VPC. Qdrant provides an Endpoint Service name to accept the connection.
**DNS:** Route 53 Private Hosted Zone aliases the Qdrant domain name to the VPC Interface Endpoint IP addresses.
**Authentication & TLS:** Traffic is encrypted via TLS 1.2+ over the private network. Authentication relies on Qdrant API Keys.
**Security Boundaries:** Traffic never traverses the public internet. 
**Failure Behavior:** Standard AWS AZ failure isolation applies; the FastAPI backend gracefully catches network timeouts (HTTP 503 behavior) if the PrivateLink degrades.
**Fallback Architecture:** If PrivateLink cannot be purchased, the fallback is public internet routing via NAT Gateway, secured by TLS, strict API keys, and Qdrant Cloud IP Allowlisting restricted exclusively to the NAT Gateway Elastic IPs.

## 2. Secrets Manager and IAM
The architecture relies strictly on least-privilege role segregation for ECS tasks.
- **`ecsTaskExecutionRole`:** Used by the ECS agent to launch the container. 
  - **Permissions:** `ecr:GetDownloadUrlForLayer`, `logs:CreateLogStream`, `secretsmanager:GetSecretValue`, `kms:Decrypt`. 
  - **Boundary:** It reads ARNs from Secrets Manager and injects them as plaintext environment variables *during* container bootstrap.
- **`ecsTaskRole`:** Assumed by the running Next.js/FastAPI application.
  - **Permissions:** None (or strictly restricted S3 bucket access if required in the future).
  - **Boundary:** Because secrets are injected as environment variables, the running application container does NOT need `secretsmanager:GetSecretValue` permissions, nor does it require AWS SDKs to execute. This guarantees that an application vulnerability cannot be exploited to traverse the AWS control plane.

## 3. Terraform State Security
Terraform state (`terraform.tfstate`) manages cloud configuration. 
- **Storage:** Amazon S3 backend with `Block Public Access` enabled.
- **Encryption:** Encrypted at rest via a customer-managed AWS KMS Key (`aws/s3` default or strict CMK).
- **Locking:** DynamoDB table to prevent concurrent state corruption.
- **Versioning:** S3 versioning enabled to allow state recovery on corruption.
- **Secrets Boundary:** Terraform configures the *existence* of AWS Secrets Manager objects using the `aws_secretsmanager_secret` resource, but does NOT manage the secret payloads. Secret values are injected out-of-band (e.g., via AWS CLI or AWS Console). Therefore, plaintext secrets are never written into the Terraform state file.

## 4. NAT Gateway Analysis
**Outbound Dependencies:**
- External LLM Provider API (Requires public internet / NAT).
- Qdrant Cloud (Avoided via PrivateLink, but required if fallback used).
- AWS APIs: ECR, CloudWatch, Secrets Manager, S3.
**Optimization:** To prevent routing internal AWS API traffic through the expensive NAT Gateway, VPC Interface/Gateway Endpoints MUST be provisioned for ECR, CloudWatch, Secrets Manager, and S3.
**Production Recommendation:** Multi-AZ high availability mandates 2 NAT Gateways (one per public subnet). While optimizing to 1 NAT Gateway halves the idle cost ($45/mo savings), a single-AZ failure would sever the application's ability to communicate with the external LLM provider, effectively breaking the AI Reasoning path. Therefore, 2 NAT Gateways are required.

## 5. RDS Backup and Restore
**Strategy:** Amazon RDS Automated Backups.
**Capabilities:** 
- Retention: 30 days. 
- Point-In-Time-Recovery (PITR): Available up to 5 minutes ago.
- Encryption: AWS KMS.
- Deletion Protection: ENABLED on production instance.
**Restore Procedure:** AWS RDS restores backups to a *new* database instance endpoint. The application's `DATABASE_URL` secret must be rotated in Secrets Manager, and the ECS tasks forcefully restarted to consume the new connection string.
**Status:** DESIGNED. Restore mechanics validated via `pg_dump` locally, but AWS RDS native restore workflows are NOT YET TESTED.

## 6. Qdrant Backup and Restore
**Strategy:** Qdrant Cloud Native Snapshots.
**Capabilities:** Automated snapshot generation directly within the managed service.
**Restore Procedure:** Handled via Qdrant Cloud console or HTTP API `/recover`. Tenant isolation logic remains enforced transparently post-restore, as payload filtering is native to the points, not the infrastructure.
**Status:** DESIGNED. Local API recovery validated via scripts, but Qdrant Cloud UI/native mechanics are NOT YET TESTED.

## 7. Cost Model (Estimated Monthly)
*Baseline production scale, Multi-AZ, us-east-1.*
- **Amazon RDS (db.t4g.medium Multi-AZ):** ~$100/mo (Storage: 100GB io1)
- **ECS Fargate Backend (2 Tasks: 2vCPU/4GB):** ~$120/mo
- **ECS Fargate Frontend (2 Tasks: 1vCPU/2GB):** ~$60/mo
- **ALB (1) + AWS WAF:** ~$50/mo
- **NAT Gateways (2):** ~$90/mo
- **VPC Endpoints & Data Processing:** ~$40/mo
- **CloudWatch, S3, ECR, Route 53, Secrets:** ~$40/mo
- **Qdrant Cloud (Dedicated Cluster):** ~$200 - $300/mo
**Total Estimated Range:** $700 - $800 / month.
*Top Cost Drivers:* Qdrant Cloud, ECS Compute, Multi-AZ RDS. Exact costs scale proportionally with NAT egress traffic volume to the LLM provider.

## 8. PHI Data Flow
| Component | May contain PHI? | Encryption at rest | Encryption in transit | Access control | Retention | External dependency |
| --- | --- | --- | --- | --- | --- | --- |
| **RDS PostgreSQL** | **YES** | AWS KMS | TLS (Forced) | DB Auth / Security Groups | Indefinite | None |
| **Qdrant Cloud** | **YES** | Qdrant Native / EBS | AWS PrivateLink / TLS | API Key / SG | Indefinite | Qdrant Cloud |
| **ECS Backend** | YES (Memory) | N/A | TLS | IAM / Internal Network | Ephemeral | None |
| **ECS Frontend** | YES (Memory) | N/A | TLS | IAM / Internal Network | Ephemeral | None |
| **CloudWatch Logs** | NO (Enforced by code) | AWS KMS | TLS | IAM Log Policies | 30-365 Days | None |
| **S3 (TF State)** | NO | AWS KMS | TLS | IAM / Bucket Policies | Indefinite | None |
| **RDS Backups** | **YES** | AWS KMS | N/A | AWS IAM | 30 Days | None |
| **AI LLM Provider** | **YES** | External | TLS | API Key | **Zero-Retention BAA** | OpenAI/Anthropic |

*Note: AWS HIPAA eligibility does not guarantee compliance. The organization holds strict operational responsibility to execute the Business Associate Agreements (BAAs) with AWS and the external AI Provider.*

## 9. Go-Live Gate Refinement

### A. MUST PASS BEFORE ANY PRODUCTION TRAFFIC (Synthetic data only)
- TLS Validated
- WAF Rules Enforced
- VPC Endpoints & NAT Gateways Validated
- Application Authentication Validated
- Multi-Tenant / PatientAccess Isolation Validated
- Audit Trail Execution Validated
- RDS Automated Backups Configured
- Production Secrets Injected Safely
- IAM Least Privilege Boundaries Validated
- ECS Auto-Scaling & Rollback Behaviors Validated
- Synthetic Production Smoke Tests Passed

### B. MUST BE TESTED BEFORE PRODUCTION PHI (No real clinical data yet)
- RDS Restore from Snapshot Tested in a secondary environment
- Qdrant Restore from Snapshot Tested
- Monitoring & Critical Alarms Validated (Fire drill)
- AI Success Path Validated via Safe LLM Provider Config OR Explicitly Documented as Operational Limitation
- No unresolved CRITICAL/HIGH security findings

### C. POST-GO-LIVE IMPROVEMENTS
- Cross-region snapshot replication (Disaster Recovery).
- Stress/load testing for precise Auto-Scaling thresholds.
