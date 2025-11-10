# Terraform AWS VPC

This module creates the followoing resources
* VPC
* IGW
* 2 Public subnets in us-east-1a and us-east-1b AZ
* 2 Private subnets in us-east-1a and us-east-1b AZ
* 2 Database subnets in us-east-1a and us-east-1b AZ
* Public Route table
* Private Route table
* Database Route table
* EIP for NAT
* NAT Gateway in public subnet 1a az
* IGW route is added to public route table
* NAT Gateway route to private and database route table
* Route table association with subnets
* VPC to default VPC peering
* Public route table to default VPC route
* Default VPC main route table to created VPC route

### Inputs
vpc_cidr
project_name
vpc_tags
environment
public_cidr
private_cidr
database_cidr
availability_zone
is_required_peering

