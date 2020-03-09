variable "env" {}
variable "organization" {}

module "acme-twitter-feed-bucket" {
  source = "../../modules/s3"
  bucket_name = "acme-twitter-feed"
}

module "lambda-functions-bucket" {
  source = "../../modules/s3"
  bucket_name = "acme-twitter-lambda-functions"
}