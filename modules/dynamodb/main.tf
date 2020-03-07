resource "aws_dynamodb_table" "tweets" {
  name = "rawTweets"
  billing_mode = "PROVISIONED"
  read_capacity = 5
  write_capacity = 5
  hash_key = "id"

  attribute {
    name = "id"
    type = "N"
  }
}

resource "aws_dynamodb_table" "sentiment" {
  name = "twitterSentiment"
  billing_mode = "PROVISIONED"
  read_capacity = 5
  write_capacity = 5
  hash_key = "sentiment"

  attribute {
    name = "sentiment"
    type = "S"
  }
}