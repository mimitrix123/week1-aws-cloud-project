# Assignment 5 — CI/CD with AWS CodePipeline

The CloudFormation template creates an encrypted S3 artifact bucket, IAM roles, CodeBuild validation project, and CodePipeline source/build stages.

Before deployment, create and authorize a GitHub CodeConnections connection in AWS. Then deploy:

```bash
aws cloudformation deploy \
  --stack-name week4-codepipeline \
  --template-file template.yaml \
  --capabilities CAPABILITY_NAMED_IAM \
  --parameter-overrides \
    ConnectionArn=arn:aws:codeconnections:REGION:ACCOUNT:connection/ID \
    FullRepositoryId=mimitrix123/week1-aws-cloud-project
```

The pipeline retrieves the GitHub branch through CodeConnections and runs `buildspec.yml` in CodeBuild. The build invokes the Week 4 validation script.

The connection must be authorized interactively in the AWS console; credentials are intentionally not stored in the repository.