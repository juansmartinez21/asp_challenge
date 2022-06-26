variable "bucket_regional_domain_name" {
    description = "Cloudfront domain name"
}
variable "bucket_id" {
    description = "The Id of the S3 bucket"
}
variable "cloudfront_access_identity_path" {
    description = "Path that refers to OAI user"

}
variable "lambda_arn" {
    description = "lambda function arn"
}