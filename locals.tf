locals {
  project_name = "terraform-aws-learning-lab"

  common_tags = {
    Project     = local.project_name
    Environment = "lab"
    ManagedBy   = "Terraform"
  }
}
