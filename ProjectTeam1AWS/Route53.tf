# Route 53
resource "aws_route53_record" "wordpress" {
  zone_id = "Z07527642U8DJ1Y2FLMQC"
  name    = "wordpress.cyberreplicant.com"
  type    = "CNAME"
  ttl     = 5

  records = [aws_lb.task.dns_name]
}
