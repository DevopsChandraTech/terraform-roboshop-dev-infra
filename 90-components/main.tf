module "components" {
  source = "../../terraform-roboshop-component"
  component = var.component
  rule_priority = var.rule_priority
  project_name = var.project_name
  environment = var.environment
  domain_name = var.domain_name
}