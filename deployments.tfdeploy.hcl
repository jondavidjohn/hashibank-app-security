# This is a temporary file for our final diagnostic test.
# It removes the Linked Stacks functionality to see if the rest of the stack deploys.

identity_token "aws" {
  audience = ["aws.workload.identity"]
}

# --- The upstream_input block is commented out for this test ---
# upstream_input "main_vpc" {
#   stack  = "tfstacks-vpc-eks-hashibank"
#   output = "vpc_id"
# }

deployment "app_security" {
  inputs = {
    # For this test, we are providing a hardcoded VPC ID.
    # Replace this with the actual VPC ID from your main HashiBank stack's output.
    vpc_id = "vpc-024cf39243612974e"

    # The rest of the inputs remain the same.
    role_arn           = "arn:aws:iam::177099687113:role/tfstacks-role" # Use your role ARN
    aws_identity_token = identity_token.aws.jwt
  }
}