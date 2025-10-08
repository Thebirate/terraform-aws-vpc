output "vpc_id" {
  description = "The ID of the VPC."
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "A list of public subnet IDs."
  value       = aws_subnet.public.*.id
}

output "private_subnet_ids" {
  description = "A list of private subnet IDs."
  value       = aws_subnet.private.*.id
}

output "security_group_id" {
  description = "The ID of the security group for EC2 instances."
  value       = aws_security_group.ec2_sg.id
}

output "internet_gateway_id" {
  description = "The ID of the created Internet Gateway."
  value       = aws_internet_gateway.main.id
}