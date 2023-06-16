resource "aws_vpc" "project-terraform-vpc" {
  cidr_block = "10.0.0.0/16"

}

resource "aws_internet_gateway" "task_ig" {
  vpc_id = aws_vpc.project-terraform-vpc.id


}

resource "aws_route" "route" {
  route_table_id         = aws_vpc.project-terraform-vpc.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.task_ig.id
}

resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.project-terraform-vpc.id
  cidr_block = "10.0.101.0/24"

  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true


}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.project-terraform-vpc.id
  cidr_block = "10.0.102.0/24"

  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public3" {
  vpc_id     = aws_vpc.project-terraform-vpc.id
  cidr_block = "10.0.103.0/24"

  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.project-terraform-vpc.id
  cidr_block = "10.0.1.0/24"

  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.project-terraform-vpc.id
  cidr_block = "10.0.2.0/24"

  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private3" {
  vpc_id     = aws_vpc.project-terraform-vpc.id
  cidr_block = "10.0.3.0/24"

  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true
}

resource "aws_nat_gateway" "nat1" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.private1.id
}
