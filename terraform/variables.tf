variable "project" {
  description = "The project name for the resources"
  type        = string
  default     = "serverless_app"
}

variable "owner" {
  description = "The owner of the resources"
  type        = string
  default     = "fredydlemus"
}

variable "environment" {
  description = "The environment for the resources"
  type        = string
  default     = "dev"
}