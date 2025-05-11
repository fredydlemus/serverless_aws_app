output "table_name" {
  description = "value of the DynamoDB table name"
  value       = aws_dynamodb_table.this.name
}

output "table_arn" {
  description = "value of the DynamoDB table ARN"
  value       = aws_dynamodb_table.this.arn
}

output "table_id" {
  description = "value of the DynamoDB table ID"
  value       = aws_dynamodb_table.this.id

}