# Week 1, Week 3 & Week 4 AWS Cloud Computing Projects

This repository contains completed AWS cloud-computing coursework.

## Week 1

Week 1 covers AWS basics, IAM, EC2, S3, RDS, Lambda, and the IAM & S3 mini project.

## Week 3 — Networking, Databases & Serverless Computing

Implemented with Terraform and Python:

- VPC with public/private subnets, routing, NAT Gateway, EC2 and security groups
- Private MySQL RDS + EC2 connectivity
- Serverless contact form with Lambda, API Gateway and CloudWatch

See [`week3/`](week3/).

## Week 4 — Deployment, Automation & Capstone

The Week 4 brief covers Elastic Beanstalk, CloudFormation, load balancing and Auto Scaling, Route 53, CodePipeline, and final deployment/optimization.

The PDF lists topics and three major-project options rather than separate numbered assignment questions. This repository turns each covered topic into a practical assignment and implements **AWS Infrastructure Automation** as the capstone.

### Assignments

1. Elastic Beanstalk automatic deployment — [`week4/assignment-1-elastic-beanstalk/`](week4/assignment-1-elastic-beanstalk/)
2. CloudFormation — [`week4/assignment-2-cloudformation/`](week4/assignment-2-cloudformation/)
3. Load Balancing & Auto Scaling — [`week4/assignment-3-alb-autoscaling/`](week4/assignment-3-alb-autoscaling/)
4. Route 53 — [`week4/assignment-4-route53/`](week4/assignment-4-route53/)
5. CodePipeline CI/CD — [`week4/assignment-5-codepipeline/`](week4/assignment-5-codepipeline/)

### Week 4 Capstone

[`week4/mini-project-aws-infrastructure-automation/`](week4/mini-project-aws-infrastructure-automation/) provisions:

- VPC with public/private subnets
- NAT Gateway and routing
- Application Load Balancer
- Auto Scaling Group
- Private MySQL RDS
- Encrypted/private S3 bucket
- CloudFormation automation
- CodePipeline/CodeConnections + CodeBuild validation
- Optional Route 53 DNS integration

## Security

Never commit AWS access keys, secret keys, passwords, `.pem` files, or Terraform state. Use AWS CLI credential configuration, environment variables, or IAM roles.

## Region

Examples use **AWS Mumbai (`ap-south-1`)** where a regional example is required. CloudFormation AMIs use the AWS public SSM parameter for Amazon Linux 2023 where possible.

## GitHub

The project uses the `main` branch.
