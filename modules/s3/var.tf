variable "bucket_name" {
    description = "the name of the bucket"
}

variable "acl_value" {
    default = "private"
    description = "bucket access level values"
}

variable "oai_iam_arn"{
    description = "iam arn"
}

