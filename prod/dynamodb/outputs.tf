output "tweets_table_name" {
  value = module.dynamodb.tweets_table_name
}

output "tweets_table_stream_arn" {
  value = module.dynamodb.tweets_table_stream_arn
}

output "sentiment_table_name" {
  value = module.dynamodb.sentiment_table_name
}