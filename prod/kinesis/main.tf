variable "env" {}
variable "organization" {}

variable "iam__role_arn" {}
variable "s3__bucket_arn" {}


module "kinesis" {
  source = "../../modules/kinesis"
  env = var.env
  organization = var.organization
  name = "acme-twitter"
  firehose_role_arn = var.iam__role_arn
  firehose_taget_bucket_arn = var.s3__bucket_arn

}
