include {
  path = find_in_parent_folders()
}

dependency "lambda-functions-s3-bucket" {
  config_path = "../lambda-functions-s3-bucket"
  mock_outputs_allowed_terraform_commands = [
    "validate",
    "plan"]

  mock_outputs = {
    bucket_arn = "fake__lambda_functions_bucket_arn"
    bucket_name = "fake__lambda_functions_bucket_name"
  }
}

dependency "twitter-feed-s3-bucket" {
  config_path = "../twitter-feed-s3-bucket"
  mock_outputs_allowed_terraform_commands = [
    "validate",
    "plan"]

  mock_outputs = {
    bucket_arn = "fake__twitter_feed_bucket_arn"
    bucket_name = "fake__twitter_feed_bucket_name"
    bucket_id = "fake__twitter_feed_bucket_id"
  }
}

dependency "iam" {
  config_path = "../iam"
  mock_outputs_allowed_terraform_commands = [
    "validate",
    "plan"]

  mock_outputs = {
    role_arn = "fake__role_arn"
  }
}


dependency "dynamodb" {
  config_path = "../dynamodb"
  mock_outputs_allowed_terraform_commands = [
    "validate",
    "plan"]

  mock_outputs = {
    tweets_table_name = "fake__dynamodb_tweets_table_name"
  }
}


inputs = {
  lambda_functions_s3__bucket_name = dependency.lambda-functions-s3-bucket.outputs.bucket_name
  twitter_feed_s3__bucket_id = dependency.twitter-feed-s3-bucket.outputs.bucket_id
  twitter_feed_s3__bucket_arn = dependency.twitter-feed-s3-bucket.outputs.bucket_arn
  iam__role_arn = dependency.iam.outputs.role_arn
  dynamodb_tweets_table_name = dependency.dynamodb.outputs.tweets_table_name
}