variable "env" {}
variable "organization" {}

variable "iam__role_arn" {}
variable "s3__bucket_arn" {}


module "lambda-s3-to-dynamodb" {
  source = "../../modules/lambda-s3-to-dynamodb"
  lambda_function_handler = "app.handler"
  lambda_functions_bucket = "acme-twitter-lambda-functions"
  lambda_functions_bucket_prefix = "twitter-unpack/v1.0/867ee4f478d4b9241d733e5907d602b3"
  role_arn = var.iam__role_arn
  tweets_bucket_id = var.s3__bucket_arn
}