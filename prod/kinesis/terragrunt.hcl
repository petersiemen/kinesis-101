include {
  path = find_in_parent_folders()
}

dependency "s3" {
  config_path = "../s3"
  mock_outputs_allowed_terraform_commands = [
    "validate", "plan"]

  mock_outputs = {
    twitter_feed_bucket_arn = "fake__twitter_feed_bucket_arn"
    twitter_feed_bucket_name = "fake__twitter_feed_bucket_name"
    lambda_functions_bucket_arn = "fake__lambda_functions_bucket_arn"
    lambda_functions_bucket_name = "fake__lambda_functions_bucket_name"
  }
}

dependency "iam" {
  config_path = "../iam"
  mock_outputs_allowed_terraform_commands = [
    "validate", "plan"]

  mock_outputs = {
    role_arn = "fake__role_arn"
  }
}


inputs = {
  s3__twitter_feed_bucket_arn = dependency.s3.outputs.twitter_feed_bucket_arn
  iam__role_arn = dependency.iam.outputs.role_arn
}