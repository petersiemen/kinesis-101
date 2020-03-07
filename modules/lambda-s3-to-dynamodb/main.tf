resource "aws_lambda_function" "lambda-update-security-groups" {
  function_name = "twitter-unpack"

  s3_bucket = var.lambda_functions_bucket
  s3_key = var.lambda_functions_bucket_prefix

  handler = var.lambda_function_handler
  runtime = "nodejs12.x"

  role = var.role_arn

  environment {
    variables = {
      DYNAMODB_TABLE = "rawTweets"
    }

  }
}


resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = var.tweets_bucket_id

  lambda_function {
    lambda_function_arn = var.role_arn
    events = [
      "s3:ObjectCreated:*"]
    filter_prefix = "AWSLogs/"
    filter_suffix = ".log"
  }
}