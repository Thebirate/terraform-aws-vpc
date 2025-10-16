variable "project_name" {
  description = "The name for the project to be used in resource tags."
  type        = string
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "public_subnets" {
  description = "A list of CIDR blocks for the public subnets."
  type        = list(string)
}

variable "private_subnets" {
  description = "A list of CIDR blocks for the private subnets."
  type        = list(string)
}

variable "availability_zones" {
  description = "A list of Availability Zones to deploy subnets in."
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway for private subnets to access the internet."
  type        = bool
  default     = false
}

variable "create_security_group" {
  description = "Whether to create a default security group for EC2 instances."
  type        = bool
  default     = true
}