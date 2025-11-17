module "vpc" {
  source = "git::https://github.com/DevopsChandraTech/terraform-roboshop-vpc.git?ref=main" # it will take ref
  #ref = main take main branch or ref = dev take dev branch the code goes to git hub branch for global access
  cidr_block = var.cidr_block
  project_name = var.project_name
  vpc_tags = var.vpc_tags
  environment = var.environment
  public_cidr = var.public_cidr
  private_cidr = var.private_cidr 
  database_cidr = var.database_cidr
  is_required_peering = false # true then created false then deleted
}