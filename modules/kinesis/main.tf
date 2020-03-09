resource "aws_kinesis_stream" "stream" {
  name = "${var.name}-stream"
  shard_count = 1
  retention_period = 48

  shard_level_metrics = [
    "IncomingBytes",
    "OutgoingBytes",
  ]

  tags = {
    Environment = var.env
    Organization = var.organization
  }


}


resource "aws_kinesis_firehose_delivery_stream" "s3_stream" {
  name = "${var.name}-firehose-to-s3-delivery"
  destination = "s3"

  kinesis_source_configuration {
    kinesis_stream_arn = aws_kinesis_stream.stream.arn
    role_arn = var.firehose_role_arn
  }

  s3_configuration {
    role_arn = var.firehose_role_arn
    bucket_arn = var.firehose_target_bucket_arn
    buffer_size = 1
    buffer_interval = 60
  }
}

