include {
  path = find_in_parent_folders()
}

dependency "twitter-feed-s3-bucket" {
  config_path = "../"
  mock_outputs_allowed_terraform_commands = [
    "validate", "plan"]

  mock_outputs = {
    bucket_arn = "fake__twitter_feed_bucket_arn"
    bucket_name = "fake__twitter_feed_bucket_name"
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
  twitter_feed_s3__bucket_arn = dependency.twitter-feed-s3-bucket.outputs.bucket_arn
  iam__role_arn = dependency.iam.outputs.role_arn
}