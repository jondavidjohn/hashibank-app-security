# This file defines the "how" - the tools needed to build our components.

required_providers {
  aws = {
    source  = "hashicorp/aws"
    version = "~> 5.0"
  }
}

# This configures a default AWS provider.
# It will use the same dynamic credentials as your main stack.
provider "aws" "default" {
  config {
    region = "us-east-1" # Or your desired region

    assume_role_with_web_identity {
      role_arn           = var.role_arn
      web_identity_token = var.aws_identity_token
    }
  }
}