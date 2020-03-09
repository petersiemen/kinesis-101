output "tweets_table_name" {
  value = module.dynamodb.tweets_table_name
}

output "sentiment_table_name" {
  value = module.dynamodb.sentiment_table_name
}