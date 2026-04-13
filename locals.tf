locals {
  site_bucket_name    = "${var.project}-site-${var.env}"
  docs_bucket_name    = "${var.project}-docs-${var.env}"
  cloudfront_oac_name = "${var.project}-oac-${var.env}"
  lambda_name         = "${var.project}-chatbot-${var.env}"
  api_name            = "${var.project}-api-${var.env}"

  common_tags = {
    Project     = var.project
    Environment = var.env
    ManagedBy   = "terraform"
    Owner       = "ghana"
  }
}