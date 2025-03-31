terraform {
  backend "s3" {
    bucket = "kpo-w7-terraformbucket"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}
