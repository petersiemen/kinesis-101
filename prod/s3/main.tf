variable "env" {}
variable "organization" {}

module "s3" {
  source = "../../modules/s3"
  bucket_name = "acme-twitter"
}

module "lambda-functions-bucket" {
  source = "../../modules/s3"
  bucket_name = "acme-twitter-lambda-functions"
}