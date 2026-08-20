# AWS Infrastructure Automation Capstone

This capstone implements the third Week 4 major-project option from the supplied brief: use CloudFormation to deploy EC2, RDS and S3 automatically, with version control through CodePipeline. It also combines the covered ALB/Auto Scaling and optional Route 53 topics.

## Architecture

GitHub → CodeConnections → CodePipeline → CodeBuild validation → CloudFormation

CloudFormation creates:

- VPC with two public and two private subnets
- Internet Gateway and NAT Gateway
- Application Load Balancer in public subnets
- Auto Scaling Group in private subnets
- Private MySQL RDS in private subnets
- Encrypted private S3 bucket
- IAM instance role
- CloudWatch target-tracking CPU scaling
- Optional Route 53 alias record

## Deploy manually

```bash
aws cloudformation validate-template --template-body file://template.yaml
aws cloudformation deploy \
  --stack-name week4-capstone \
  --template-file template.yaml \
  --capabilities CAPABILITY_NAMED_IAM
```

The stack uses small defaults (`t3.micro`) suitable for classroom testing. Review pricing and quotas before deployment.

## Optional DNS

Leave `HostedZoneId` and `RecordName` empty to skip DNS. To enable the Route 53 record, provide both values for an existing hosted zone.

## CI/CD

`codepipeline.yaml` provisions a CodePipeline that gets the repository through CodeConnections, validates the source with CodeBuild, and deploys the CloudFormation stack. The connection must be authorized in AWS before the pipeline can access GitHub.

## Cleanup

```bash
aws cloudformation delete-stack --stack-name week4-capstone
```

Check the CloudFormation stack events and S3 bucket contents before deletion. The bucket is retained by default so uploaded data is not unexpectedly deleted.
