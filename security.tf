resource "aws_security_group" "web" {
  name        = "terraform-lab-web"
  description = "Security group"
  vpc_id      = aws_vpc.lab.id
  tags = {
    Name = "terraform-lab-web"
  }

}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.web.id
  description       = "HTTP access"

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "tcp"
  from_port   = 80
  to_port     = 80
}

resource "aws_vpc_security_group_egress_rule" "all_ipv4" {
  security_group_id = aws_security_group.web.id
  description       = "all outbound IPV4 traffic"

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}