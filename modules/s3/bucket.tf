resource "aws_s3_bucket" "aspbucket" {
    bucket = var.bucket_name
    policy = <<EOF
    {
        "Id": "S3BucketPolicyCloudFront",
        "Statement": [
            {
            "Action": "s3:GetObject",
            "Effect": "Allow",
            "Principal": {
            "AWS": "${var.oai_iam_arn}"
            },
        "Resource": "arn:aws:s3:::${var.bucket_name}/*",
        "Sid": "Allow to CloudFront Origin Identity access to bucket content after login"
        }
        ],
        "Version": "2012-10-17"
    }
    EOF
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  bucket = aws_s3_bucket.aspbucket.id
  acl    = "${var.acl_value}"
}

