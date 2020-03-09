variable "env" {}
variable "organization" {}
variable "lambda_s3_to_dynamodb_prefix" {}

variable "iam__role_arn" {}
variable "s3__twitter_feed_bucket_id" {}
variable "s3__twitter_feed_bucket_arn" {}
variable "s3__lambda_functions_bucket_name" {}
variable "dynamodb_tweets_table_name" {}

module "lambda-s3-to-dynamodb" {
  source = "../../modules/lambda-s3-to-dynamodb"
  lambda_function_handler = "app.handler"
  lambda_functions_bucket = var.s3__lambda_functions_bucket_name
  lambda_functions_bucket_prefix = var.lambda_s3_to_dynamodb_prefix
  role_arn = var.iam__role_arn
  tweets_bucket_id = var.s3__twitter_feed_bucket_id
  tweets_bucket_arn = var.s3__twitter_feed_bucket_arn
  dynamodb_table = var.dynamodb_tweets_table_name

}