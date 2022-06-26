resource "aws_cloudfront_distribution" "cloudfront_distribution" {
  origin {
    domain_name = var.bucket_regional_domain_name
    origin_id   = "S3-${var.bucket_id}"

    s3_origin_config {
      origin_access_identity = var.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "lambda edge function to enable authentication to a s3 bucket through a Node.Js function"
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "S3-${var.bucket_id}"
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400

    forwarded_values {
      query_string = true
      cookies {
        forward = "all"
      }
    }

    lambda_function_association {
      event_type   = "viewer-request"
      lambda_arn   = var.lambda_arn
      include_body = false
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}