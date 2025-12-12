/* module "components" {
  source = "../../terraform-roboshop-component"
  component = var.component
  rule_priority = var.rule_priority
  project_name = var.project_name
  environment = var.environment
  domain_name = var.domain_name
} */

module "components" {
  for_each = var.components
  source = "git::https://github.com/DevopsChandraTech/terraform-roboshop-component.git?ref=main"
  project_name = var.project_name
  environment = var.environment
  domain_name = var.domain_name
  component = each.key
  rule_priority = each.value.rule_priority
}