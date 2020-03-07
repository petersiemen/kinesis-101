variable "env" {}
variable "organization" {}

module "iam" {
  source = "../../modules/iam"
  env = var.env
  organization = var.organization
}