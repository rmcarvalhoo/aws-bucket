#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "first_bucket_terraform" {
  bucket = "curso-terraform-cremildo"
}