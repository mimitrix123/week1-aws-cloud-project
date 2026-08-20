variable "aws_region" {
  description = "AWS region for the lab."
  type        = string
  default     = "ap-south-1"
}

variable "vpc_id" {
  description = "VPC ID created by Assignment 1."
  type        = string
}

variable "private_subnet_id_1" {
  description = "First private subnet ID created by Assignment 1."
  type        = string
}

variable "private_subnet_id_2" {
  description = "Second private subnet ID created by Assignment 1."
  type        = string
}

variable "application_subnet_id" {
  description = "Subnet for the sample application EC2. Use the public subnet for simple SSH access or a private subnet when using SSM/bastion access."
  type        = string
}

variable "application_security_group_id" {
  description = "Security group ID allowed to connect to MySQL on port 3306."
  type        = string
}

variable "application_ami_id" {
  description = "Ubuntu AMI ID in the selected AWS region."
  type        = string
}

variable "application_instance_type" {
  description = "EC2 instance type for the sample application."
  type        = string
  default     = "t3.micro"
}

variable "db_instance_class" {
  description = "RDS MySQL instance class."
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Initial RDS storage in GiB."
  type        = number
  default     = 20
}

variable "max_allocated_storage" {
  description = "Maximum autoscaling storage in GiB."
  type        = number
  default     = 50
}

variable "db_name" {
  description = "Initial MySQL database name."
  type        = string
  default     = "contactdb"
}

variable "db_username" {
  description = "RDS master username."
  type        = string
  default     = "appadmin"
}

variable "db_password" {
  description = "RDS master password. Supply via TF_VAR_db_password or an uncommitted tfvars file."
  type        = string
  sensitive   = true
}
