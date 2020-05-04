### AWS EC2 base image for webserver provisioning

Usage:
```bash
# Set your AWS credentials using env variables
export AWS_ACCESS_KEY="your-aws-secret-key"
export AWS_SECRET_ACCESS_KEY="your-aws-secret-access-key"

# Run "terraform plan", and check the output of the current plan

# Example:
➜  terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

aws_security_group.webservers: Refreshing state... [id=xxx]
aws_instance.webserver: Refreshing state... [id=xxx]

--------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.webserver will be created
  + resource "aws_instance" "webserver" {
      ...
      ...
      ...
  }

# Run "terraform apply", it will show you the terraform plan again, if fits with your provisioning plan, Enter value: "yes" and the provisioning will start

#Example:
➜  terraform apply
aws_security_group.webservers: Refreshing state... [id=xxx]
aws_instance.example: Refreshing state...[id=xxx]
An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.webserver will be created
  + resource "aws_instance" "webserver" {
      ...
      ...
      ...
  }
  
  Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_instance.webserver: Creating...
aws_instance.webserver: Still creating... [10s elapsed]
aws_instance.webserver: Still creating... [20s elapsed]
aws_instance.webserver: Still creating... [30s elapsed]
aws_instance.webserver: Creation complete after 36s [id=xxx]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

```