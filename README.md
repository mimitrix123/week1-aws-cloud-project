# Week 1 & Week 3 AWS Cloud Computing Projects

This repository contains completed AWS cloud-computing coursework. Week 1 covers AWS basics, IAM, EC2, S3, and a static-site mini project. Week 3 extends the work into networking, databases, and serverless computing.

## Week 1

The Week 1 assignment work covers AWS account setup, IAM, core services (EC2, S3, RDS, Lambda), and an IAM & S3 hands-on mini project.

See the existing `week1/`, `assignment-1-ec2/`, `assignment-2-s3/`, and `mini-project-portfolio/` directories.

## Week 3 — Networking, Databases & Serverless Computing

The supplied Week 3 brief covers Amazon VPC, subnets, route tables, security groups, AWS RDS MySQL connectivity, AWS Lambda, API Gateway, and CloudWatch.

### Assignment 1 — VPC with Public & Private Subnets

Implemented with Terraform:

- VPC with public and private subnets
- Internet Gateway and NAT Gateway
- Public and private route tables
- Public and private EC2 instances
- Security groups with restricted SSH and application traffic

See [`week3/assignment-1-vpc/`](week3/assignment-1-vpc/).

### Assignment 2 — MySQL RDS + EC2 Connectivity

Implemented with Terraform:

- Private MySQL RDS instance
- Multi-AZ DB subnet group
- RDS security group allowing MySQL from the application EC2 security group
- Flask sample application hosted on EC2
- Application health endpoint that verifies database connectivity

See [`week3/assignment-2-rds/`](week3/assignment-2-rds/).

### Mini Project — Serverless Contact Form

Implemented with Terraform and Python:

- AWS Lambda function processes contact form data
- API Gateway HTTP API exposes `POST /contact`
- Browser frontend included
- `curl`/Postman testing instructions included
- CloudWatch log group configured
- Python unit tests included

See [`week3/mini-project-serverless-contact-form/`](week3/mini-project-serverless-contact-form/).

## Security

Never commit AWS access keys, secret keys, passwords, `.pem` files, or Terraform state. Use AWS CLI credential configuration or environment variables. RDS is intentionally private in the Week 3 implementation.

The Week 3 mini project uses `Access-Control-Allow-Origin: *` for classroom simplicity. Restrict CORS origins before production use.

## Region

The project examples use **AWS Mumbai (`ap-south-1`)**, matching the existing Week 1 repository configuration.

## GitHub

The project uses the `main` branch.
