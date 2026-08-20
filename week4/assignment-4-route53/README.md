# Assignment 4 — Route 53

This assignment creates an alias A record pointing an existing Route 53 name at an Application Load Balancer.

The domain must already be registered/hosted in Route 53. Supply the hosted-zone ID, record name, ALB DNS name and ALB canonical hosted-zone ID:

```bash
aws cloudformation deploy \
  --stack-name week4-route53 \
  --template-file template.yaml \
  --parameter-overrides \
    HostedZoneId=Z123456789 \
    RecordName=app.example.com \
    LoadBalancerDnsName=my-alb-123.ap-south-1.elb.amazonaws.com \
    LoadBalancerHostedZoneId=ZP97RAFLXTNZK
```

Do not guess the IDs; obtain them from the AWS console or CLI for the actual hosted zone and ALB.