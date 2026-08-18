# Week 1 — Introduction to Cloud Computing & AWS Basics

This folder contains the completed Week 1 assignment and mini-project from the BeeSkilled Cloud Computing with AWS module.

## Assignment 1 — Create and Configure AWS Account

The assignment requires:

- AWS Free Tier account setup.
- IAM users and role/permission assignment.
- Exploration of the AWS Management Console.

> Account creation and IAM changes require access to an AWS account. This repository contains the implementation guide and security checklist; no AWS credentials are stored in GitHub.

### Recommended IAM setup

1. Sign in to the AWS Management Console as the account owner only for initial account setup.
2. Enable MFA on the root account.
3. Create a dedicated IAM administrative user for daily work, or use AWS IAM Identity Center where available.
4. Avoid using the root account for normal tasks.
5. Grant only the permissions required for the exercise.
6. Never commit AWS access keys, secret keys, passwords, or session tokens to this repository.

## Assignment 2 — Core AWS Services

| Service | Function | Typical use |
|---|---|---|
| EC2 | Resizable virtual servers | Run applications, APIs, and workloads |
| S3 | Object storage | Store static files, backups, media, and website assets |
| RDS | Managed relational database | Run relational databases without managing the database server infrastructure |
| Lambda | Serverless compute | Run code in response to events without managing servers |

See [`core-aws-services.md`](./core-aws-services.md) for the detailed summary.

## Mini Project — IAM & S3 Hands-On

The repository includes:

- A least-privilege example IAM policy.
- A static website under `mini-project-portfolio/`.
- An S3 deployment guide and bucket-policy example.
- AWS CLI commands with placeholders so no secrets or account-specific values are committed.

See [`mini-project.md`](./mini-project.md).

## Repository structure

```text
week1-aws-cloud-project/
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

## Security reminder

The course asks students to test public S3 access. Public access should be enabled only for the required learning test and should be disabled afterward. Do not place private, personal, or sensitive information in a public bucket.
