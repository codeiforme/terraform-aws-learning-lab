output "backend_config" {
  description = "Backend configuration for the learning lab"

  value = <<-EOT
      bucket       = "${aws_s3_bucket.state.id}"
      key          = "lab/terraform.tfstate"
      region       = "eu-north-1"
      encrypt      = true
      use_lockfile = true
    EOT
}
