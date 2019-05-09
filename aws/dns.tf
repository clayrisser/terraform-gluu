data "aws_route53_zone" "iam" {
  name  = "${var.domain}"
}
resource "aws_route53_record" "iam" {
  zone_id = "${data.aws_route53_zone.iam.zone_id}"
  name    = "${var.name}.${var.domain}."
  type    = "A"
  ttl     = "300"
  records = ["${aws_eip.iam.public_ip}"]
}
