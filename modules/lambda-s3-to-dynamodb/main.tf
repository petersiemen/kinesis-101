resource "aws_lambda_function" "s3-to-dynamodb" {
  function_name = "s3-to-dynamodb"

  s3_bucket = var.lambda_functions_bucket
  s3_key = var.lambda_functions_bucket_prefix

  handler = var.lambda_function_handler
  runtime = "nodejs12.x"

  role = var.role_arn

  environment {
    variables = {
      DYNAMODB_TABLE = var.dynamodb_table
    }
  }
}


resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = var.tweets_bucket_id

  lambda_function {
    lambda_function_arn = aws_lambda_function.s3-to-dynamodb.arn
    events = [
      "s3:ObjectCreated:*"]
  }
  depends_on = [
    aws_lambda_permission.s3]
}



 resource "aws_lambda_permission" "s3" {
   statement_id  = "AllowExecutionFromS3"
   action        = "lambda:InvokeFunction"
   function_name = aws_lambda_function.s3-to-dynamodb.function_name
   principal     = "s3.amazonaws.com"

   # The "/*/*" portion grants access from any method on any resource
   # within the API Gateway REST API.
   source_arn = var.tweets_bucket_arn
 }
