terraform {
  source = "../..//stacks/full"
}

# When creating new environments, check the locals carefully, the rest is mostly boilerplate

locals {
  env_name    = "dev"
  resource_name = "interview-phe"
  aws_region  = "eu-west-3"
}

inputs = {
  env_name    = local.env_name
  aws_region  = local.aws_region
  resource_name = local.resource_name
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = format("terraform-remote-state-%s", get_aws_account_id())
    dynamodb_table = format("terraform-remote-state-%s", get_aws_account_id())
    key            = format("%s/vcv/terraform.tfstate", local.env_name)
    encrypt        = true
    region         = local.aws_region
  }
}

include {
  path = find_in_parent_folders()
}
