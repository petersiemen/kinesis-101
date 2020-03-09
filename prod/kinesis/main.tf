variable "env" {}
variable "organization" {}

variable "iam__role_arn" {}
variable "twitter_feed_s3__bucket_arn" {}


module "kinesis" {
  source = "../../modules/kinesis"
  env = var.env
  organization = var.organization
  name = "acme-twitter"
  firehose_role_arn = var.iam__role_arn
  firehose_target_bucket_arn = var.twitter_feed_s3__bucket_arn
}
