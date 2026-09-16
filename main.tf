resource "aws_vpc" "lab" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "terraform-aws-learning-lab"
  }
}

resource "aws_subnet" "lab" {
  vpc_id     = aws_vpc.lab.id
  cidr_block = var.subnet_cidr

  tags = {
    Name = "terraform-aws-learning-lab-subnet"
  }
}