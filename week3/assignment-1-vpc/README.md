# Assignment 1 — VPC with Public & Private Subnets

This implementation completes the Week 3 requirement to create an Amazon VPC with public and private subnets, launch EC2 instances in both, and configure inbound/outbound security rules.

## Architecture

- VPC: `10.0.0.0/16`
- Public subnet: `10.0.1.0/24`
- Private subnet 1: `10.0.2.0/24`
- Private subnet 2: `10.0.3.0/24` (second AZ for RDS subnet-group requirements)
- Internet Gateway for the public subnet
- NAT Gateway for private-subnet outbound access
- Public EC2 running Apache
- Private EC2 running Apache with no public IP
- SSH restricted to `admin_cidr`
- Private EC2 SSH/HTTP allowed from the public EC2 security group

## Deploy

1. Install Terraform and configure AWS credentials using your normal AWS CLI profile/environment. Do **not** put credentials in this repository.
2. Copy `terraform.tfvars.example` to `terraform.tfvars`.
3. Replace `YOUR_PUBLIC_IP/32` with your public IPv4 CIDR.
4. Run:

```bash
terraform init
terraform fmt -check
terraform validate
terraform plan
terraform apply
```

The outputs include the public IP and private IP of the EC2 instances.

## Verify

Open `http://<public_instance_public_ip>` in a browser. The page should display **Week 3 Public EC2**.

The private instance has no public IP. From the public EC2 instance, you can test connectivity to its private IP.

## Cleanup

NAT Gateways and EIPs can incur AWS charges. When the assignment is complete:

```bash
terraform destroy
```
