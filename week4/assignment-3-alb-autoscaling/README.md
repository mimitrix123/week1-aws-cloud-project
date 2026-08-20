# Assignment 3 — Load Balancing & Auto Scaling

The template creates two public subnets, an Application Load Balancer, target group, launch template, Auto Scaling Group, and target-tracking CPU scaling policy.

```bash
aws cloudformation deploy --stack-name week4-alb-asg --template-file template.yaml
```

Use the `LoadBalancerUrl` output to test the service. Refreshing the page can show different instance IDs as the load balancer distributes requests.

Delete the stack when finished to avoid ongoing EC2/ALB charges.