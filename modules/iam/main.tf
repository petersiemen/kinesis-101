resource "aws_iam_role" "kinesis-101-role" {
  name = "${var.organization}-${var.env}-kinesis-101-role"
  path = "/terraform/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": [ "lambda.amazonaws.com", "kinesis.amazonaws.com", "firehose.amazonaws.com"]
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}


resource "aws_iam_role_policy_attachment" "enable-lambda" {
  policy_arn = "arn:aws:iam::aws:policy/AWSLambdaFullAccess"
  role = aws_iam_role.kinesis-101-role.id
}

resource "aws_iam_role_policy_attachment" "enable-comprehend" {
  policy_arn = "arn:aws:iam::aws:policy/ComprehendFullAccess"
  role = aws_iam_role.kinesis-101-role.id
}

resource "aws_iam_role_policy_attachment" "enable-cloudwatchlogs" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
  role = aws_iam_role.kinesis-101-role.id
}

resource "aws_iam_role_policy_attachment" "enable-kinesis" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonKinesisFullAccess"
  role = aws_iam_role.kinesis-101-role.id
}

resource "aws_iam_role_policy_attachment" "enable-kinesisfirehose" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonKinesisFirehoseFullAccess"
  role = aws_iam_role.kinesis-101-role.id
}

resource "aws_iam_role_policy_attachment" "enable-s3" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role = aws_iam_role.kinesis-101-role.id
}