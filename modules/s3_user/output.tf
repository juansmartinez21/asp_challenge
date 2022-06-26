output "output_user_name" {
    description = "new s3 username"
    value = aws_iam_user.asp_bucket_user.name
}

output "output_user_secret" {
    description = "new s3 user's secret"
    value = aws_iam_access_key.lb.encrypted_secret
}