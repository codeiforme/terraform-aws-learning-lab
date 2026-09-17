data "aws_ssm_parameter" "amazon_linux" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

resource "aws_instance" "web" {
  ami           = data.aws_ssm_parameter.amazon_linux.value
  instance_type = "t3.micro"

  subnet_id                   = aws_subnet.lab.id
  vpc_security_group_ids      = [aws_security_group.web.id]
  associate_public_ip_address = true

  user_data_replace_on_change = true

  user_data = <<-EOF
      #!/bin/bash
      set -eu
      dnf install -y httpd
      echo '<h1>This is a test to create a webserver with terraform</h1>' > /var/www/html/index.html
      systemctl enable --now httpd
    EOF

  depends_on = [
    aws_route_table_association.lab,
    aws_vpc_security_group_egress_rule.all_ipv4
  ]

  tags = {
    Name = "terrafrom-lab-web"
  }

}


