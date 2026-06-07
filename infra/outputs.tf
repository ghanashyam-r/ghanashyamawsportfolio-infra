output "cloudfront_url" {
  description = "Your site URL — use this to access your portfolio"
  value       = "https://${aws_cloudfront_distribution.site.domain_name}"
}

output "cloudfront_distribution_id" {
  description = "Needed for cache invalidation in CI/CD"
  value       = aws_cloudfront_distribution.site.id
}

output "site_bucket_name" {
  description = "Upload your site files here"
  value       = aws_s3_bucket.site.bucket
}

output "docs_bucket_name" {
  description = "Upload resume and docs here for Phase 2"
  value       = aws_s3_bucket.docs.bucket
}
output "chat_api_url" {
  description = "HTTP API endpoint"
  value       = aws_apigatewayv2_stage.default.invoke_url
}