resource "aws_iam_role" "lambda_role" {
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "lambda.amazonaws.com",
          "edgelambda.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}



resource "aws_iam_role_policy" "iam_policy_for_lambda" {
  role = "${aws_iam_role.lambda_role.id}"
  policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": [
       "logs:CreateLogGroup",
       "logs:CreateLogStream",
       "logs:PutLogEvents"
     ],
     "Resource": "arn:aws:logs:*:*:*",
     "Effect": "Allow"
   }
 ]
}
EOF
}

#Template for credentials
data "template_file" "auth_function" {
  template = "${file("${path.module}/functions/auth.js")}"
  vars = {
    user = var.user
    password = var.password
  }
}

#Template's Zip
data "archive_file" "zip_auth_function" {
  type = "zip"
  source {
    content = data.template_file.auth_function.rendered
    filename = "auth.js"
  }
  output_path = "./static/lambda/auth.zip"
   
}

resource "aws_lambda_function" "auth_function" {
  filename         = "./static/lambda/auth.zip"
  function_name    = var.function_name
  role             = aws_iam_role.lambda_role.arn
  handler          = "auth.handler"
  source_code_hash = data.archive_file.zip_auth_function.output_base64sha256
  runtime          = "nodejs14.x"
  description      = "Node.Js function with basic auth"
  publish          = true
}