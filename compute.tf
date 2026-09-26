data "aws_ssm_parameter" "amazon_linux" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

resource "aws_instance" "web" {
  ami           = data.aws_ssm_parameter.amazon_linux.value
  instance_type = "t3.micro"

  subnet_id                   = aws_subnet.lab.id
  vpc_security_group_ids      = [module.web_security.security_group_id]
  associate_public_ip_address = true

  user_data_replace_on_change = true

  user_data = templatefile("${path.module}/templates/user-data.sh.tftpl", {
    project_name    = local.project_name
    welcome_message = var.welcome_message
  })



  depends_on = [
    aws_route_table_association.lab,
    module.web_security,
  ]

  tags = {
    Name = "${local.project_name}-web"
  }

}


