provider "aws" {
  region = var.aws_region
}

data "aws_route53_zone" "main" {
  name         = var.domain_name
  private_zone = false
}

module "certificate" {
  source = "./modules/certificate"

  domain_name = var.domain_name
  zone_id     = data.aws_route53_zone.main.zone_id
}

module "s3" {
  source = "./modules/s3"

  bucket_name       = var.bucket_name
  enable_versioning = var.enable_versioning
  bucket_policy     = data.aws_iam_policy_document.s3_policy.json
}

module "cloudfront" {
  source = "./modules/cloudfront"

  full_domain            = var.full_domain
  bucket_domain_name     = module.s3.bucket_regional_domain_name
  bucket_id             = module.s3.bucket_id
  default_root_object   = var.cf_default_root_object
  price_class           = var.cf_price_class
  certificate_arn       = module.certificate.certificate_arn
  minimum_protocol_version = var.cf_minimum_protocol_version
}

data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${module.s3.bucket_arn}/*"]
    principals {
      type        = "AWS"
      identifiers = [module.cloudfront.oai_iam_arn]
    }
  }
  
  statement {
    actions   = ["s3:PutObject", "s3:PutObjectAcl"]
    resources = ["${module.s3.bucket_arn}/*"]
    principals {
      type        = "AWS"
      identifiers = [var.devops_iam_arn]
    }
  }
}

resource "aws_route53_record" "media_dns" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = var.full_domain
  type    = "A"

  alias {
    name                   = module.cloudfront.distribution_domain_name
    zone_id                = module.cloudfront.distribution_hosted_zone_id
    evaluate_target_health = false
  }
}
