module "web_security" {
  source = "./modules/web_security"

  vpc_id       = aws_vpc.lab.id
  project_name = local.project_name
}

