output "distribution_domain_name" {
  value = aws_cloudfront_distribution.media_cdn.domain_name
}
output "distribution_hosted_zone_id" {
  value = aws_cloudfront_distribution.media_cdn.hosted_zone_id
}
output "oai_iam_arn" {
  value = aws_cloudfront_origin_access_identity.media_oai.iam_arn
}
