variable "env" {}
variable "organization" {}

variable "iam__role_arn" {}
variable "lambda_functions_s3__bucket_name" {}
variable "dynamodb__tweets_table_stream_arn" {}
variable "dynamodb__sentiment_table_name" {}

module "lambda-compute-sentiment" {
  source = "../../modules/lambda-compute-sentiment"
  lambda_function_name = "compute-sentiment"
  lambda_function_handler = "app.handler"
  lambda_functions_bucket = var.lambda_functions_s3__bucket_name
  lambda_functions_bucket_prefix = "compute-sentiment/v1.0/cfcdee17a0b0265472bf700509bf5ae2"
  lambda_execution_role_arn = var.iam__role_arn
  sentiment_dynamodb_table = var.dynamodb__sentiment_table_name
  raw_tweets_dynamodb_table_stream_arn = var.dynamodb__tweets_table_stream_arn
}