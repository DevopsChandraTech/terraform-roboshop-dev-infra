locals {
  common_name_suffix = "${var.project_name}-${var.environment}-acm"
  common_tags = {
    Project = "roboshop"
    Environment = "dev"
    Terraform = "true"
  }
}