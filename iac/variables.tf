# variables.tf
variable "aws_region" {
  description = "AWS region for resources"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "domain_name" {
  description = "Main domain name"
  type        = string
}

variable "subdomain" {
  description = "Subdomain prefix"
  type        = string
}

variable "full_domain" {
  description = "Full domain name including subdomain"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "enable_versioning" {
  description = "Enable versioning for S3 bucket"
  type        = bool
}

variable "cf_price_class" {
  description = "CloudFront distribution price class"
  type        = string
}

variable "cf_default_root_object" {
  description = "Default root object for CloudFront"
  type        = string
}

variable "cf_minimum_protocol_version" {
  description = "Minimum TLS protocol version"
  type        = string
}

variable "devops_iam_arn" {
  description = "IAM ARN for DevOps user"
  type        = string
}
