# Week 2 – AWS Compute & Storage Services

This repository contains complete, VS Code-ready solutions for the Week 2 AWS assignments and mini project from the provided course brief.

## Included

1. **Assignment 1 – Launch and Configure an EC2 Instance**
   - Ubuntu EC2 instance
   - Apache web server
   - Static portfolio website
   - SSH connection instructions

2. **Assignment 2 – S3 Static Website Hosting**
   - S3 bucket setup
   - Static HTML/CSS website
   - Bucket policy template
   - AWS CLI deployment commands

3. **Mini Project – Deploy a Static Portfolio Website on AWS**
   - Responsive HTML/CSS portfolio
   - S3 deployment
   - Optional CloudFront guidance

## Folder structure

```text
week2-aws/
├── assignment-1-ec2/
│   ├── website/
│   │   ├── index.html
│   │   └── style.css
│   ├── setup-apache.sh
│   └── README.md
├── assignment-2-s3/
│   ├── website/
│   │   ├── index.html
│   │   └── style.css
│   ├── bucket-policy.json
│   └── README.md
├── mini-project-portfolio/
│   ├── index.html
│   ├── style.css
│   └── README.md
├── .gitignore
└── README.md
```

## VS Code

1. Extract this repository.
2. Open the `week2-aws` folder in VS Code.
3. Open the integrated terminal.
4. For local website testing, open `mini-project-portfolio/index.html` with a Live Server extension, or use any local HTTP server.

## GitHub

```bash
git init
git add .
git commit -m "Complete Week 2 AWS assignments and portfolio project"
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/week2-aws.git
git push -u origin main
```

Replace `YOUR-USERNAME` with your GitHub username and create the empty repository first.

## Important AWS safety notes

- Never commit `.pem` private keys, AWS access keys, passwords, or secret values.
- The supplied S3 policy contains a placeholder bucket name.
- Public S3 website hosting intentionally makes website content publicly readable. Use only non-sensitive files.
- AWS charges can apply to resources such as EC2, S3, and CloudFront. Stop/terminate resources when the assignment is complete.

## Source alignment

The course brief asks for EC2 + Apache/Nginx hosting, S3 static website hosting with public permissions, and a static portfolio on S3 with optional CloudFront.
