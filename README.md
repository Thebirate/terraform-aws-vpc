# Terraform AWS VPC Module

This Terraform module creates a standard AWS Virtual Private Cloud (VPC) with public and private subnets, an Internet Gateway, and optional NAT Gateway. It's designed to be a reusable and highly available networking foundation for your AWS infrastructure.

## Features

- VPC with DNS support and DNS hostnames enabled
- Multiple public and private subnets across availability zones
- Internet Gateway for public subnet internet access
- Optional NAT Gateway for private subnet internet access
- Optional security group for EC2 instances
- Configurable CIDR blocks and availability zones

## Usage

```hcl
module "vpc" {
  source = "github.com/your_github_username/terraform-aws-vpc"
  
  project_name       = "my-awesome-project"
  vpc_cidr_block     = "10.0.0.0/16"
  public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets    = ["10.0.101.0/24", "10.0.102.0/24"]
  availability_zones = ["us-east-1a", "us-east-1b"]
  
  # Optional: Enable NAT Gateway for private subnet internet access
  enable_nat_gateway = true
  
  # Optional: Create a default security group for EC2 instances
  create_security_group = true
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| aws | ~> 5.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project_name | The name of the project for resource tags | `string` | n/a | yes |
| vpc_cidr_block | The CIDR block for the VPC | `string` | n/a | yes |
| public_subnets | A list of CIDR blocks for the public subnets | `list(string)` | n/a | yes |
| private_subnets | A list of CIDR blocks for the private subnets | `list(string)` | n/a | yes |
| availability_zones | A list of Availability Zones to deploy subnets in | `list(string)` | n/a | yes |
| enable_nat_gateway | Enable NAT Gateway for private subnets to access the internet | `bool` | `false` | no |
| create_security_group | Whether to create a default security group for EC2 instances | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| vpc_id | The ID of the VPC |
| public_subnet_ids | A list of the public subnet IDs |
| private_subnet_ids | A list of the private subnet IDs |
| security_group_id | The ID of the security group for EC2 instances (if created) |
| internet_gateway_id | The ID of the created Internet Gateway |
| nat_gateway_id | The ID of the NAT Gateway (if created) |
| nat_gateway_public_ip | The public IP address of the NAT Gateway (if created) |

## Notes

- **NAT Gateway**: Enabling NAT Gateway will incur additional AWS costs (~$0.045/hour + data transfer). It's recommended for production environments where private subnet resources need internet access.
- **Security Group**: The default security group allows SSH (port 22) from anywhere. Modify the security group rules based on your security requirements.
- **High Availability**: For production environments, consider creating NAT Gateways in multiple availability zones.

## Examples

### Basic VPC (no NAT Gateway)

```hcl
module "vpc" {
  source = "github.com/your_github_username/terraform-aws-vpc"
  
  project_name       = "dev-app"
  vpc_cidr_block     = "10.0.0.0/16"
  public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets    = ["10.0.101.0/24", "10.0.102.0/24"]
  availability_zones = ["us-east-1a", "us-east-1b"]
}
```

### Production VPC with NAT Gateway

```hcl
module "vpc" {
  source = "github.com/your_github_username/terraform-aws-vpc"
  
  project_name          = "prod-app"
  vpc_cidr_block        = "10.0.0.0/16"
  public_subnets        = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnets       = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  availability_zones    = ["us-east-1a", "us-east-1b", "us-east-1c"]
  enable_nat_gateway    = true
  create_security_group = false  # Manage security groups separately
}
```
