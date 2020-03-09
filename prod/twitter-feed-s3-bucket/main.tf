variable "env" {}
variable "organization" {}
variable "aws_account_id" {}

variable "iam__role_name" {}

module "twitter-feed-s3-bucket" {
  source = "../../modules/twitter-feed-s3-bucket"
  bucket_name = "acme-twitter-feed"
  aws_account_id = var.aws_account_id
  iam_role_for_s3_access = var.iam__role_name
}
