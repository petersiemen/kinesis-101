variable "env" {}
variable "organization" {}
variable "lambda_s3_to_dynamodb_prefix" {}

variable "iam__role_arn" {}
variable "lambda_functions_s3__bucket_name" {}
variable "twitter_feed_s3__bucket_id" {}
variable "twitter_feed_s3__bucket_arn" {}
variable "dynamodb_tweets_table_name" {}

module "lambda-s3-to-dynamodb" {
  source = "../../modules/lambda-s3-to-dynamodb"
  lambda_function_handler = "app.handler"
  lambda_functions_bucket = var.lambda_functions_s3__bucket_name
  lambda_functions_bucket_prefix = var.lambda_s3_to_dynamodb_prefix
  role_arn = var.iam__role_arn
  tweets_bucket_id = var.twitter_feed_s3__bucket_id
  tweets_bucket_arn = var.twitter_feed_s3__bucket_arn
  dynamodb_table = var.dynamodb_tweets_table_name

}