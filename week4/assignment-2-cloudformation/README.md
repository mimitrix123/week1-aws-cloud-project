# Assignment 2 — AWS CloudFormation

Deploy the template with:

```bash
aws cloudformation validate-template --template-body file://template.yaml
aws cloudformation deploy --stack-name week4-cfn-basic --template-file template.yaml --capabilities CAPABILITY_NAMED_IAM
```

The stack creates a VPC, public subnet, Internet Gateway, route table, EC2 web server and encrypted private S3 bucket. Delete the stack after testing; the S3 bucket is retained by design.