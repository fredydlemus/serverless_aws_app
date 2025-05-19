variable "lambda_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "handler" {
  description = "The function entrypoint in your code"
  type        = string
}

variable "runtime" {
  description = "The runtime environment for the Lambda function"
  type        = string
}
variable "timeout" {
  description = "The amount of time that Lambda allows a function to run before stopping it"
  type        = number
  default     = 3
}
variable "dynamodb_table_arn" {
  description = "The ARN of the DynamoDB table to which the Lambda function will write"
  type        = string
}

variable "filename" {
  description = "The path to the deployment package"
  type        = string
}