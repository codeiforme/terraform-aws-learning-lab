# Terraform AWS learning lab

I built this project to practice Terraform with AWS. I started with a VPC, then added a small web server. The lab runs in `eu-north-1`.

The infrastructure includes:

- A VPC and a public subnet.
- An Internet Gateway and a route table.
- An EC2 instance using Amazon Linux 2023.
- A security group that allows HTTP traffic.
- An S3 bucket for the Terraform state.

I used variables for the region, network ranges and web page message. I added validation for the CIDR format and empty messages. Locals and default tags keep the resource names and tags consistent.

The startup script is in `templates/`. It uses `templatefile()` to build the Apache setup script and the web page. An output returns the website URL.

I moved the security group and its rules into `modules/web_security`. I used `moved` blocks to keep the existing resources. I also imported a security group created manually in AWS.

The `bootstrap/` folder manages the state bucket and the GitHub Actions IAM role. The bucket has versioning and public access blocked. The lab uses an encrypted S3 backend with state locking. The bootstrap state stays local.

I practiced `init`, `fmt`, `validate`, `plan`, `apply` and `destroy`. I also saved plans before applying them.

GitHub Actions checks formatting and validates both configurations. I prepared an OIDC role and a workflow to run plans from `main`. The plan workflow still needs its file location and YAML indentation fixed before it can run.
