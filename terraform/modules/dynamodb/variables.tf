variable "name" {
  description = "The name of the DynamoDB table."
  type        = string
}

variable "partition_key" {
  description = "The partition key of the DynamoDB table."
  type        = string
}

variable "billing_mode" {
  description = "The billing mode of the DynamoDB table."
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "point_in_time_recovery" {
  description = "Enable point in time recovery."
  type        = bool
  default     = false
}

variable "server_side_encryption" {
  description = "Enable server-side encryption."
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "environment" {
  description = "The environment for the resource (e.g., dev, staging, prod)."
  type        = string
}

variable "project" {
  description = "The project name for the resource."
  type        = string
}

variable "owner" {
  description = "The owner of the resource."
  type        = string
}