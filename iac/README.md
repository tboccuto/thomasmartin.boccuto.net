# Static Content Hosting with S3 and CloudFront

A Terraform configuration for hosting static content using S3 and CloudFront with SSL.
## Prerequisites
- AWS CLI configured
- Terraform installed
- Domain managed in Route53
## Quick Start
1. **Create `terraform.tfvars`**
```hcl
aws_region = "us-east-1"
environment = "prod"

# Domain configuration
domain_name = "example.com"
subdomain = "media"
full_domain = "media.example.com"

# S3 configuration
bucket_name = "media.example.com"
enable_versioning = true

# CloudFront configuration
cf_price_class = "PriceClass_100"
cf_default_root_object = "index.html"
cf_minimum_protocol_version = "TLSv1.2_2021"

# IAM configuration
devops_iam_arn = "arn:aws:iam::YOUR_ACCOUNT_ID:user/YourUser"
```


