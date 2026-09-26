moved {
  from = aws_security_group.web
  to   = module.web_security.aws_security_group.web
}

moved {
  from = aws_vpc_security_group_ingress_rule.http
  to   = module.web_security.aws_vpc_security_group_ingress_rule.http
}

moved {
  from = aws_vpc_security_group_egress_rule.all_ipv4
  to   = module.web_security.aws_vpc_security_group_egress_rule.all_ipv4
}
