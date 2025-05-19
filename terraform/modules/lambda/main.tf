resource "aws_lamnda_function" "this" {
  function_name = var.lambda_name
  role          = aws_iam_role.lambda_execution_role.arn
  handler       = var.handler
  runtime       = var.runtime
  filename      = var.filename
  source_code_hash = filebase64sha256(var.filename)
  timeout       = var.timeout
}

resource "aws_iam_policy" "dynamodb_write_policy" {
  name        = "${var.lambda_name}-dynamodb-write-policy"
  description = "Policy to allow Lambda function to write to DynamoDB"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "dynamodb:PutItem",
          "dynamodb:UpdateItem",
          "dynamodb:BatchWriteItem",
        ]
        Resource = var.dynamodb_table_arn
      },
    ]
  })
}

resource "aws_iam_role" "lambda_execution_role" {
  name = "${var.lambda_name}-execution-role"
  assume_role_policy = {
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : "sts:AssumeRole",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "lambda.amazonaws.com"
        }
      }
    ]
  }
}

resource "aws_iam_role_policy_attachment" "lambda_dynamodb_write" {
  role = aws_iam_role.lambda_execution_role.name
  policy_arn = aws_iam_policy.dynamodb_write_policy.arn
}

resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.lambda_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
