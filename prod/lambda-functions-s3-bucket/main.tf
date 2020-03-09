variable "env" {}
variable "organization" {}


module "lambda-functions-s3-bucket" {
  source = "../../modules/lambda-functions-s3-bucket"
  bucket_name = "acme-twitter-lambda-functions"
}