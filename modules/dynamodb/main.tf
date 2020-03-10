resource "aws_dynamodb_table" "tweets" {
  name = var.tweets_table_name
  billing_mode = "PROVISIONED"
  read_capacity = 5
  write_capacity = 5
  hash_key = "id"
  stream_enabled = true
  stream_view_type = "NEW_IMAGE"

  attribute {
    name = "id"
    type = "N"
  }
}

resource "aws_dynamodb_table" "sentiment" {
  name = var.sentiment_table_name
  billing_mode = "PROVISIONED"
  read_capacity = 5
  write_capacity = 5
  hash_key = "sentiment"

  attribute {
    name = "sentiment"
    type = "S"
  }
}