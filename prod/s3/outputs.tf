output "twitter_feed_bucket_arn" {
  value = module.acme-twitter-feed-bucket.bucket_arn
}

output "twitter_feed_bucket_name" {
  value = module.acme-twitter-feed-bucket.bucket_name
}

output "twitter_feed_bucket_id" {
  value = module.acme-twitter-feed-bucket.bucket_id
}

output "lambda_functions_bucket_arn" {
  value = module.lambda-functions-bucket.bucket_arn
}

output "lambda_functions_bucket_name" {
  value = module.lambda-functions-bucket.bucket_name
}