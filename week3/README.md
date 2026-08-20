# Week 3 — Networking, Databases & Serverless Computing

This directory contains completed implementations for the Week 3 course work. The supplied Week 3 brief covers Amazon VPC, subnets, route tables, security groups, RDS MySQL connectivity, Lambda, API Gateway, and CloudWatch monitoring.

## Assignments

### 1. VPC with Public & Private Subnets

Terraform creates a VPC with public and private subnets, route tables, an Internet Gateway, a NAT Gateway, security groups, and EC2 instances in both public and private subnets. This directly addresses the first assignment requirements.

See [`assignment-1-vpc/`](assignment-1-vpc/).

### 2. MySQL RDS + EC2 Connectivity

Terraform creates a private MySQL RDS instance, a multi-AZ DB subnet group, an RDS security group allowing MySQL only from the application EC2 security group, and a sample application EC2 host. This addresses the second assignment requirements.

See [`assignment-2-rds/`](assignment-2-rds/).

### Mini Project — Serverless Contact Form

The project implements the required Lambda processor, API Gateway endpoint, browser/Postman test path, and CloudWatch logging.

See [`mini-project-serverless-contact-form/`](mini-project-serverless-contact-form/).

## Security notes

- No AWS access keys, secret keys, passwords, or private key files belong in this repository.
- RDS is private and does not accept public database traffic.
- SSH access is restricted by `admin_cidr` in Assignment 1.
- Terraform state can contain sensitive infrastructure values; keep local state files out of Git.
- The mini project uses permissive CORS (`*`) for a simple classroom demo. Tighten the origin list before production use.

## Prerequisites

- AWS account with appropriate permissions
- AWS CLI configured locally
- Terraform >= 1.6
- Python 3.12+ for Lambda tests
- Postman or `curl` for API testing
