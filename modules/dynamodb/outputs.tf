output "tweets_table_name" {
  value = aws_dynamodb_table.tweets.name
}

output "sentiment_table_name" {
  value = aws_dynamodb_table.sentiment.name
}