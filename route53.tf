variable vercel_cname { default = "cname.vercel-dns.com" }

resource "aws_route53_zone" "blntrsz" {
  name = "blntrsz.com"
}

resource "aws_route53_record" "default" {
  zone_id = aws_route53_zone.blntrsz.zone_id
  name    = "blntrsz.com"
  type    = "A"
  ttl     = 300
  records = ["76.76.21.123"]
}

resource "aws_route53_record" "c" {
  zone_id = aws_route53_zone.blntrsz.zone_id
  name    = "c"
  type    = "CNAME"
  ttl     = 300
  records = [var.vercel_cname]
}

resource "aws_route53_record" "json" {
  zone_id = aws_route53_zone.blntrsz.zone_id
  name    = "json"
  type    = "CNAME"
  ttl     = 300
  records = [var.vercel_cname]
}

resource "aws_route53_record" "link" {
  zone_id = aws_route53_zone.blntrsz.zone_id
  name    = "link"
  type    = "CNAME"
  ttl     = 300
  records = [var.vercel_cname]
}

resource "aws_route53_record" "movieligent" {
  zone_id = aws_route53_zone.blntrsz.zone_id
  name    = "movieligent"
  type    = "CNAME"
  ttl     = 300
  records = [var.vercel_cname]
}

resource "aws_route53_record" "r" {
  zone_id = aws_route53_zone.blntrsz.zone_id
  name    = "r"
  type    = "CNAME"
  ttl     = 300
  records = [var.vercel_cname]
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.blntrsz.zone_id
  name    = "www"
  type    = "CNAME"
  ttl     = 300
  records = [var.vercel_cname]
}
