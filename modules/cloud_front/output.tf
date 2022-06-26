output "output_cloudfront_distribution_id" {
    description = "Id of the cloudfront distribution"
    value = aws_cloudfront_distribution.cloudfront_distribution.id
}

output "output_domain_name" {
    description = "Cloudfront domain name"
    value = aws_cloudfront_distribution.cloudfront_distribution.domain_name
}