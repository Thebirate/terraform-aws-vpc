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
  description = "The ID of the security group for EC2 instances (if created)."
  value       = var.create_security_group ? aws_security_group.ec2_sg[0].id : null
}

output "internet_gateway_id" {
  description = "The ID of the created Internet Gateway."
  value       = aws_internet_gateway.main.id
}

output "nat_gateway_id" {
  description = "The ID of the NAT Gateway (if created)."
  value       = var.enable_nat_gateway ? aws_nat_gateway.main[0].id : null
}

output "nat_gateway_public_ip" {
  description = "The public IP address of the NAT Gateway (if created)."
  value       = var.enable_nat_gateway ? aws_eip.nat[0].public_ip : null
}