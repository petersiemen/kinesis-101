output "tweets_table_name" {
  value = aws_dynamodb_table.tweets.name
}

output "tweets_table_stream_arn" {
  value = aws_dynamodb_table.tweets.stream_arn
}

output "sentiment_table_name" {
  value = aws_dynamodb_table.sentiment.name
}