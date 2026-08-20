# Assignment 2 — MySQL RDS + EC2 Connectivity

This implementation completes the Week 3 requirement to launch a MySQL RDS database and connect it to a sample application hosted on EC2.

## Design

- MySQL RDS is private (`publicly_accessible = false`).
- RDS is placed in a DB subnet group spanning the two private subnets from Assignment 1.
- The RDS security group allows TCP `3306` **only** from the application EC2 security group.
- A sample Flask application is installed on EC2 and queries the RDS database with `SELECT 1` on `/`.
- The database endpoint is stored in AWS Systems Manager Parameter Store.

## Deploy

1. Complete Assignment 1 first.
2. Collect its VPC/subnet/security-group outputs.
3. Copy `terraform.tfvars.example` to `terraform.tfvars` and fill in the IDs and an AMI ID for `ap-south-1`.
4. Set the database password through an environment variable:

```bash
export TF_VAR_db_password='use-a-strong-lab-password'
```

5. Run:

```bash
terraform init
terraform fmt -check
terraform validate
terraform plan
terraform apply
```

## Test the application

The application runs on port 80. If you placed it in the public subnet and used the Assignment 1 public security group, open:

```text
http://<application-ec2-public-ip>/
```

A healthy response includes `"database_connection": true`.

You can also connect directly with the MySQL client from the EC2 host:

```bash
sudo apt-get update
sudo apt-get install -y mysql-client
mysql -h <RDS_ENDPOINT> -P 3306 -u appadmin -p contactdb
```

Create a test table:

```sql
CREATE TABLE contacts (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(255) NOT NULL,
  message TEXT NOT NULL
);

SHOW TABLES;
```

## Security note

For this classroom implementation, Terraform renders the DB password into EC2 user data, which means the secret can exist in Terraform state and instance metadata/history. **Do not use this pattern in production.** A production implementation should use AWS Secrets Manager or SSM Parameter Store with an IAM role and avoid passing the password as plain user data.

Do not make the RDS instance publicly accessible and do not commit passwords or AWS credentials.

## Cleanup

```bash
terraform destroy
```
