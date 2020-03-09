variable "env" {}
variable "organization" {}

module "dynamodb" {
  source = "../../modules/dynamodb"
  tweets_table_name = "rawTweets"
  sentiment_table_name = "twitterSentiment"
}
