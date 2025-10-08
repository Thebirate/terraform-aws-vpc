output "vpc_id" {
  description = "The ID of the VPC."
  value       = module_vpc.main.id
}

output "public_subnet_ids" {
  description = "A list of public subnet IDs."
  value       = module_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "A list of private subnet IDs."
  value       = module_subnet.private[*].id
}