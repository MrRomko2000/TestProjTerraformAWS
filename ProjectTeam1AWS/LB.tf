# Creating Load Balancer
resource "aws_lb" "task" {
  name               = "task"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http.id]
  subnets            = [aws_subnet.public1.id, aws_subnet.public2.id, aws_subnet.public3.id]  

  enable_deletion_protection = true
}
