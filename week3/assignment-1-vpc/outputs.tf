output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}

output "private_subnet_2_id" {
  value = aws_subnet.private_2.id
}

output "public_instance_id" {
  value = aws_instance.public.id
}

output "public_instance_public_ip" {
  value = aws_instance.public.public_ip
}

output "private_instance_id" {
  value = aws_instance.private.id
}

output "private_instance_private_ip" {
  value = aws_instance.private.private_ip
}

output "public_security_group_id" {
  value = aws_security_group.public_ec2.id
}

output "private_security_group_id" {
  value = aws_security_group.private_ec2.id
}
