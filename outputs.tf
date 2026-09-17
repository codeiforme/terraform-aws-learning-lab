output "web_url" {
  description = "url of the web server"
  value       = "http://${aws_instance.web.public_ip}"
}
