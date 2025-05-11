locals {
  common_tags = {
    Environment = var.environment
    Project     = var.project
    Owner       = var.owner
  }
}

resource "aws_dynamodb_table" "this" {
  name         = var.name
  billing_mode = var.billing_mode

  attribute {
    name = var.partition_key
    type = "S"
  }

  hash_key = var.partition_key

  #   lifecycle {
  #     prevent_destroy = true
  #   }

  point_in_time_recovery {
    enabled = var.point_in_time_recovery
  }

  server_side_encryption {
    enabled = var.server_side_encryption
  }

  tags = merge(
    local.common_tags,
    var.tags,
  )
}