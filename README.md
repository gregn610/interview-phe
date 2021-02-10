# PHE Interview Task


# Code layout
```console
src/terraform                                   # 
├── env                                         # Environments ( dev, staging, prod etc. ) & settings / variables
│   ├── dev                                     # 
│   │   └── terragrunt.hcl                      # Use Terragrunt for DRY
│   └── prod                                    # 
│       ├── provider.tf                         # 
│       └── terragrunt.hcl                      # 
├── modules                                     # Terraform modules, no Terragrunt for portability
│   ├── phe-fargate                                # Module for Fargate demo app
│   │   ├── README.md                           # 
│   │   ├── data.tf                             # 
│   │   ├── main.tf                             # 
│   │   ├── outputs.tf                          # 
│   │   ├── turnerlabs                          # 
<snip>                                          # 
│   │   └── variables.tf                        # 
│   ├── ecr-repo                                # Module for ECR container repository
│   │   ├── data.tf                             # 
│   │   ├── files                               # 
│   │   │   └── ecr-principle-assume-role.json  # 
│   │   ├── main.tf                             # 
│   │   ├── outputs.tf                          # 
│   │   └── variables.tf                        # 
│   └── network                                 # Module for VPC and network
│       ├── data.tf                             # 
│       ├── main.tf                             # 
│       ├── outputs.tf                          # 
│       └── variables.tf                        # 
├── stacks                                      # Assemble different combinations of modules for differnt deployment requirements
│   ├── full                                    # Deploy everything
│   │   ├── terraform.tf                        # 
│   │   └── variables.tf                        # 
│   ├── lite                                    # VPC, Hostedzone, certs etc. already deployed
│   └── terragrunt.hcl                          # 
└── terragrunt.hcl                              # Use terragrunt for DRY


```

# Modules

## Network

### AWS Resources

 - module.network.data.aws_availability_zones.available
 - module.network.module.vpc.data.aws_iam_policy_document.flow_log_cloudwatch_assume_role[0]
 - module.network.module.vpc.data.aws_iam_policy_document.vpc_flow_log_cloudwatch[0]
 - module.network.module.vpc.data.aws_vpc_endpoint_service.s3[0]
 - module.network.module.vpc.aws_cloudwatch_log_group.flow_log[0]
 - module.network.module.vpc.aws_eip.nat[0]
 - module.network.module.vpc.aws_flow_log.this[0]
 - module.network.module.vpc.aws_iam_policy.vpc_flow_log_cloudwatch[0]
 - module.network.module.vpc.aws_iam_role.vpc_flow_log_cloudwatch[0]
 - module.network.module.vpc.aws_iam_role_policy_attachment.vpc_flow_log_cloudwatch[0]
 - module.network.module.vpc.aws_internet_gateway.this[0]
 - module.network.module.vpc.aws_nat_gateway.this[0]
 - module.network.module.vpc.aws_route.private_nat_gateway[0]
 - module.network.module.vpc.aws_route.public_internet_gateway[0]
 - module.network.module.vpc.aws_route_table.private[0]
 - module.network.module.vpc.aws_route_table.public[0]
 - module.network.module.vpc.aws_route_table_association.private[0]
 - module.network.module.vpc.aws_route_table_association.private[1]
 - module.network.module.vpc.aws_route_table_association.private[2]
 - module.network.module.vpc.aws_route_table_association.public[0]
 - module.network.module.vpc.aws_route_table_association.public[1]
 - module.network.module.vpc.aws_route_table_association.public[2]
 - module.network.module.vpc.aws_subnet.private[0]
 - module.network.module.vpc.aws_subnet.private[1]
 - module.network.module.vpc.aws_subnet.private[2]
 - module.network.module.vpc.aws_subnet.public[0]
 - module.network.module.vpc.aws_subnet.public[1]
 - module.network.module.vpc.aws_subnet.public[2]
 - module.network.module.vpc.aws_vpc.this[0]
 - module.network.module.vpc.aws_vpc_endpoint.s3[0]
 - module.network.module.vpc.aws_vpc_endpoint_route_table_association.private_s3[0]
 
## ECR Repo

### AWS Resources

 - module.ecr_repo.aws_iam_role.ecr_principle
 - module.network.data.aws_availability_zones.available
 - module.ecr_repo.module.ecr_repo.data.aws_iam_policy_document.empty[0]
 - module.ecr_repo.module.ecr_repo.data.aws_iam_policy_document.resource[0]
 - module.ecr_repo.module.ecr_repo.data.aws_iam_policy_document.resource_full_access[0]
 - module.ecr_repo.module.ecr_repo.data.aws_iam_policy_document.resource_readonly_access[0]
 - module.ecr_repo.module.ecr_repo.aws_ecr_lifecycle_policy.name["ns-dev-interview-phe"]
 - module.ecr_repo.module.ecr_repo.aws_ecr_repository.name["ns-dev-interview-phe"]
 - module.ecr_repo.module.ecr_repo.aws_ecr_repository_policy.name["ns-dev-interview-phe"]
 
