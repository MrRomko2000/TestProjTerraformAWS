# Creating ASG
resource "aws_launch_template" "ASG_template" {
  name_prefix   = "ASG_template"
  image_id      = "ami-04a0ae173da5807d3"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "ASG" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 99
  min_size           = 1

  launch_template {
    id      = aws_launch_template.ASG_template.id
    version = "$Latest"
  }
}
