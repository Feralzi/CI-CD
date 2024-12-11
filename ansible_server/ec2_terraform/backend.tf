terraform {
  backend "s3" {
    bucket = "tfeksterraformcicd"
    key    = "terraform.tfstate"
    region = "us-east-2"
  }
}