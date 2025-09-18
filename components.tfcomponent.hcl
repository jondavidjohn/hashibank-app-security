component "app_security_group" {
  source = "./modules/security-group"

  inputs = {
    vpc_id = var.vpc_id
  }

  providers = {
    aws = provider.aws.default
  }
}