resource "aws_security_group" "import_demo" {
  name        = "terraform-lab-import-demo"
  description = "Security group import exercise"
  vpc_id      = aws_vpc.lab.id

  tags = {
    Name = "${local.project_name}-import-demo"
  }
}

