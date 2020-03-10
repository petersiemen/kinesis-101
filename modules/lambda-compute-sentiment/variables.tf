variable "lambda_function_name" {}
variable "lambda_functions_bucket" {}
variable "lambda_functions_bucket_prefix" {}
variable "lambda_function_handler" {}
variable "lambda_execution_role_arn" {}

variable "sentiment_dynamodb_table" {}
variable "raw_tweets_dynamodb_table_stream_arn" {}