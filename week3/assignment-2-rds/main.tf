terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_subnet" "private_1" {
  id = var.private_subnet_id_1
}

data "aws_subnet" "private_2" {
  id = var.private_subnet_id_2
}

resource "aws_db_subnet_group" "mysql" {
  name       = "week3-mysql-subnet-group"
  subnet_ids = [data.aws_subnet.private_1.id, data.aws_subnet.private_2.id]

  tags = {
    Name = "week3-mysql-subnet-group"
  }
}

resource "aws_security_group" "rds" {
  name        = "week3-rds-mysql-sg"
  description = "Allow MySQL only from the application EC2 security group"
  vpc_id      = var.vpc_id

  ingress {
    description     = "MySQL from application EC2"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.application_security_group_id]
  }

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "week3-rds-mysql-sg"
  }
}

resource "aws_db_instance" "mysql" {
  identifier             = "week3-mysql"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = var.db_instance_class
  allocated_storage      = var.allocated_storage
  max_allocated_storage  = var.max_allocated_storage
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  port                   = 3306
  db_subnet_group_name   = aws_db_subnet_group.mysql.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  publicly_accessible    = false
  multi_az               = false
  storage_encrypted      = true
  backup_retention_period = 1
  deletion_protection    = false
  skip_final_snapshot    = true
  apply_immediately      = true

  tags = {
    Name = "week3-mysql"
  }
}

resource "aws_instance" "application" {
  ami                    = var.application_ami_id
  instance_type          = var.application_instance_type
  subnet_id              = var.application_subnet_id
  vpc_security_group_ids = [var.application_security_group_id]

  user_data = templatefile("${path.module}/app-user-data.sh.tftpl", {
    db_host     = aws_db_instance.mysql.address
    db_username = var.db_username
    db_password = var.db_password
    db_name     = var.db_name
  })

  tags = {
    Name = "week3-rds-app-ec2"
  }
}

resource "aws_ssm_parameter" "db_endpoint" {
  name  = "/week3/rds/mysql-endpoint"
  type  = "String"
  value = aws_db_instance.mysql.address
}
