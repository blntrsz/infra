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

module "c_sub_domain" {
  source = "./modules/blntrsz_cname_record"
  zone_id = aws_route53_zone.blntrsz.zone_id
  name    = "c"
}

module "json_sub_domain" {
  source = "./modules/blntrsz_cname_record"
  zone_id = aws_route53_zone.blntrsz.zone_id
  name    = "json"
}

module "link_sub_domain" {
  source = "./modules/blntrsz_cname_record"
  zone_id = aws_route53_zone.blntrsz.zone_id
  name    = "link"
}

module "movieligent_sub_domain" {
  source = "./modules/blntrsz_cname_record"
  zone_id = aws_route53_zone.blntrsz.zone_id
  name    = "movieligent"
}

module "r_sub_domain" {
  source = "./modules/blntrsz_cname_record"
  zone_id = aws_route53_zone.blntrsz.zone_id
  name    = "r"
}

module "www_sub_domain" {
  source = "./modules/blntrsz_cname_record"
  zone_id = aws_route53_zone.blntrsz.zone_id
  name    = "www"
}
