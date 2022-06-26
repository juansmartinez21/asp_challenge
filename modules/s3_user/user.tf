resource "aws_iam_user" "asp_bucket_user" {
  name = "aspuser"
}

resource "aws_iam_access_key" "lb" {
  user = aws_iam_user.asp_bucket_user.name
}

resource "aws_iam_user_policy" "lb_ro" {
  name = "userpolicy"
  user = aws_iam_user.asp_bucket_user.name
  policy = <<EOF
{
    "Id": "S3BucketPolicyCloudFront",
    "Statement": [
      {
            "Sid": "updateCloudFrontDistribution",
            "Effect": "Allow",
            "Action": "cloudfront:UpdateDistribution",
            "Resource": "arn:aws:cloudfront::${var.origin_id}:distribution/${var.cloudfront_distribution_id}"
    },
    {
          "Effect": "Allow",
          "Action": [
                "cloudfront:GetDistribution",
                "s3:PutObject",
                "s3:ListBucket"                
            ],
          "Resource": [
                "arn:aws:cloudfront::600205031884:distribution/${var.cloudfront_distribution_id}",
                "arn:aws:s3:::${var.bucket_name}/*",
                "arn:aws:s3:::${var.bucket_name}"
            ],
          "Sid": "policySupportUser"      
    },
    {
            "Sid": "ListResources",
            "Effect": "Allow",
            "Action": [
                "s3:ListAllMyBuckets",
                "cloudfront:ListDistributions"
            ],
            "Resource": "*"
    }
    ],

    "Version": "2012-10-17"
}
EOF
}