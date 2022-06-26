output "output_oai_path" {
    description = "patch of the oai to s3 bucket access"
    value = aws_cloudfront_origin_access_identity.oai_s3_bucket.cloudfront_access_identity_path
}

output "output_oai_iam_arn" {
    description = "Iam Arn to access to the bucket content"
    value = aws_cloudfront_origin_access_identity.oai_s3_bucket.iam_arn
}