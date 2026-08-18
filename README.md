# Week 1 AWS Cloud Computing Project

## BeeSkilled — Cloud Computing with AWS

This repository contains the completed Week 1 assignment work for **Introduction to Cloud Computing & AWS Basics**.

The assignment covers AWS account setup, IAM, core services (EC2, S3, RDS, Lambda), and an IAM & S3 hands-on mini project.

## Completed work

### Assignment 1 — AWS Account & IAM

- AWS account setup procedure documented.
- IAM user and permission approach documented.
- Security checklist included.
- No AWS credentials are stored in this repository.

### Assignment 2 — Core AWS Services

A summary report covers:

- **EC2** — virtual compute.
- **S3** — object storage.
- **RDS** — managed relational databases.
- **Lambda** — serverless function execution.

See [`week1/core-aws-services.md`](week1/core-aws-services.md).

### Mini Project — IAM & S3

The mini project requires an IAM user with specific permissions, an S3 bucket containing static files, and a public-access test.

See [`week1/mini-project.md`](week1/mini-project.md) for the complete procedure and [`week1/iam-user-policy.json`](week1/iam-user-policy.json) for the IAM example.

The static website is available in the repository root as `index.html` and `style.css` and can be uploaded to S3 for the exercise.

## Important security note

Public S3 access is included only because the course exercise asks for a public-access test. After testing, remove the public policy and re-enable S3 Block Public Access. Never commit AWS access keys, secret keys, passwords, or other credentials.

## Repository structure

```text
.
├── assignment-1-ec2/
├── assignment-2-s3/
├── mini-project-portfolio/
├── week1/
│   ├── README.md
│   ├── core-aws-services.md
│   ├── mini-project.md
│   ├── iam-user-policy.json
│   └── s3-bucket-policy.json
├── index.html
├── style.css
└── README.md
```

## GitHub

This project uses the `main` branch.
