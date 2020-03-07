variable "env" {}
variable "organization" {}

module "dynamodb" {
  source = "../../modules/dynamodb"

}
