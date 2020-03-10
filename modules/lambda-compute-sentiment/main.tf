resource "aws_lambda_function" "compute-sentiment" {
  function_name = var.lambda_function_name

  memory_size = 128
  timeout = 30

  s3_bucket = var.lambda_functions_bucket
  s3_key = var.lambda_functions_bucket_prefix

  handler = var.lambda_function_handler
  runtime = "nodejs12.x"

  role = var.lambda_execution_role_arn
  tags = {
    Prefix = var.lambda_functions_bucket_prefix
  }

  environment {
    variables = {
      DYNAMODB_TABLE = var.sentiment_dynamodb_table
    }
  }
}


resource "aws_lambda_event_source_mapping" "example" {
  event_source_arn = var.raw_tweets_dynamodb_table_stream_arn
  function_name = aws_lambda_function.compute-sentiment.arn
  starting_position = "LATEST"
  batch_size = 1
}
//
//
//resource "aws_lambda_permission" "s3" {
//  statement_id = "AllowExecutionFromS3"
//  action = "lambda:InvokeFunction"
//  function_name = aws_lambda_function.s3-to-dynamodb.function_name
//  principal = "s3.amazonaws.com"
//
//  # The "/*/*" portion grants access from any method on any resource
//  # within the API Gateway REST API.
//  source_arn = var.tweets_bucket_arn
//}
