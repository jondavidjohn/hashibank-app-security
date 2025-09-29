# This file defines the "inputs" that our entire stack accepts.

variable "vpc_id" {
  description = "The ID of the VPC to create the security group in."
  type        = string
}

variable "description" {
  description = "The description of the security group."
  type        = string
}

variable "role_arn" {
  description = "The ARN of the IAM role for HCP Terraform to assume."
  type        = string
}

variable "aws_identity_token" {
  description = "The OIDC token from HCP Terraform for AWS authentication."
  type        = string
  sensitive   = true
  ephemeral   = true
}
