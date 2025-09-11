# This is the final version of the execution plan.
# It re-enables the Linked Stacks functionality.

identity_token "aws" {
  audience = ["aws.workload.identity"]
}

# This is the magic of Linked Stacks. It tells this stack to consume an output
# published by another stack in the same project.
/*upstream_input "main_vpc" {
  stack  = "tfstacks-vpc-eks-hashibank"
  output = "vpc_id"
}*/

# This defines a single deployment for our security group.
deployment "app_security" {
  destroy = true
  inputs = {
    # It passes the value from the upstream_input into the 'vpc_id' stack variable.
    vpc_id             = upstream_input.main_vpc.value

    # It also provides the necessary values for the AWS provider.
    role_arn           = "arn:aws:iam::177099687113:role/tfstacks-role" # Use your role ARN
    aws_identity_token = identity_token.aws.jwt
  }
}