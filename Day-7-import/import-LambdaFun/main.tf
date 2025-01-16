resource "aws_lambda_function" "name" {
  function_name = "test"
  runtime = "python3.13"
  role = "arn:aws:iam::253490756950:role/service-role/test-role-cnv4ad9e"
  s3_bucket = ""
  s3_key = ""

}