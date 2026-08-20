# Week 4 Assignments

The Week 4 PDF names six covered topics: Elastic Beanstalk, CloudFormation, Load Balancing & Auto Scaling, Route 53, CodePipeline, and final deployment/optimization. It does not provide separate numbered assignment questions, so each topic is represented as a practical deployment assignment in this repository.

## Assignment 1 — Elastic Beanstalk

A minimal Flask application and Elastic Beanstalk configuration are provided. The app exposes `/` and `/health` and can be deployed with the EB CLI or through the AWS console.

## Assignment 2 — CloudFormation

The template provisions a VPC, public subnet, Internet Gateway, route table, security group, EC2 instance and S3 bucket. Parameters keep the template reusable.

## Assignment 3 — Load Balancing & Auto Scaling

The CloudFormation template provisions an ALB, target group, listener, launch template, Auto Scaling Group, and CloudWatch CPU scaling policy.

## Assignment 4 — Route 53

The template demonstrates an alias A record to an ALB. Set `HostedZoneId`, `RecordName`, and `LoadBalancerDnsName` before deployment. The domain must already be hosted in Route 53.

## Assignment 5 — CodePipeline

The template provisions an S3 artifact bucket, CodeStar Connection source, CodeBuild project, and CodePipeline. Create/authorize the CodeConnection in AWS before running the pipeline.

## Capstone — AWS Infrastructure Automation

The capstone combines the Week 4 topics into one CloudFormation-based stack: VPC, public/private networking, ALB, Auto Scaling, private RDS, S3, CloudWatch scaling, optional Route 53, and a CI/CD companion template.

## Validation

Run the included validation script from the repository root:

```bash
python scripts/validate_week4.py
```

The script checks YAML/JSON syntax, required CloudFormation sections, Terraform/CloudFormation files, and absence of obvious credential strings.

## Cost safety

CloudFormation resources can create billable AWS infrastructure. Review `plan`/change sets, use small instance sizes, and delete classroom stacks when finished.