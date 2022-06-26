variable "aws_access_key" {
    sensitive = true
}

variable "aws_secret_key" {
    sensitive = true
 }

variable "region" {
}

variable "s3_bucket_name" {    
    description = "AWS S3 Bucket name for static web hosting"
}


variable "user" {
    description = "username for authentication to s3 content"
}

