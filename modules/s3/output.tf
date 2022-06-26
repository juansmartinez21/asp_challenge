output "output_bucket_id" {
    description = "bucket Id"
    value = aws_s3_bucket.aspbucket.id
}

output "output_bucket_regional_domain_name" {
    description = "bucket regional name"
    value = aws_s3_bucket.aspbucket.bucket_regional_domain_name
}