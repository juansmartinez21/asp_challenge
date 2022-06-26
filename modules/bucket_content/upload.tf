resource "aws_s3_object" "content" {
  bucket       = var.bucket_id
  key          = "index.html"
  source       = "./static/index.html"
  content_type = "text/html"
}