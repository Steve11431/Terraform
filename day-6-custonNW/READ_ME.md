# AWS Infrastructure Resources

![Terraform Logo](https://www.terraform.io/_next/static/images/logos/terraform-logo-light.svg)


This repository contains the Terraform configuration for creating and managing AWS infrastructure resources.

## Main File Resources

### VPC:
- **Resource Name**: `aws_vpc.dev`

### Subnets:
- **Public Subnet**: `aws_subnet.public`
- **Private Subnet**: `aws_subnet.private`

### Servers:
- **Public Server**: `aws_instance.Public_server`
- **Private Server**: `aws_instance.Private_ec2`

### Route Tables and Associations:
- **Public Route Table**: `aws_route_table.dev`
- **Private Route Table**: `aws_route_table.private`
- **Public Association**: `aws_route_table_association.name`
- **Private Association**: `aws_route_table_association.private`

### Other Resources:
- **Internet Gateway**: `aws_internet_gateway.dev`
- **NAT Gateway**: `aws_nat_gateway.dev`
- **Elastic IP**: `aws_eip.nat`
- **Security Group**: `aws_security_group.allows_tls`


