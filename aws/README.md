# Using Terraform with AWS

## Prereqs

1. Sign up for AWS Account - initially sign in with 'root' account
1. Create a more 'restricted' User Account
    1. Using the Identity and Access Management (IDAM) Service
    1. Navigate to the [IAM Dashboard](https://us-east-1.console.aws.amazon.com/iamv2/home?region=eu-north-1#/home)
    1. Create a New IAM User (Users -> Create User)
        1. Set a User Name (e.g. 'tf-user')
        1. Create a 'User Group' (e.g. 'tf-automation')
        1. Associate the "AdministratorAccess" Permissions Policy to the New Group (which "Provides full access to AWS services and resources.")
        1. Click Create Group Button
        1. Add the New User to the New User Group (tick the checkbox)
        1. Click Create User Button
    1. Follow the steps to [Create an Access Key for an IAM User](https://docs.aws.amazon.com/IAM/latest/UserGuide/access-keys-admin-managed.html#admin-create-access-key)
    1. **STORE THESE SECURELY - as they will never been shown again!**

# Storing AWS Credentials
As Terraform will be making changes to AWS, we need to store the ACCESS_KEY and SECRET_ACCESS_KEY securely ...

Using short lived Environment Variables

- `export AWS_ACCESS_KEY_ID=<your-access-key-id-here>`

- `export AWS_SECRET_ACCESS_KEY=<your-secret-access-key-here>`

---
# AWS Resources

| Resource                   | Description               |
| -                         | -                         |
| [`aws_security_group`](https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest)             | Acts as a [Virtual Firewall](https://docs.aws.amazon.com/managedservices/latest/userguide/about-security-groups.html) |
| [`aws_instance`](https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/latest)                     | A Virtual Server [Elastic Compute Cloud (EC2)](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html) |
| [`aws_launch_template`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template)      | Sets up [Launch Template](https://docs.aws.amazon.com/autoscaling/ec2/userguide/launch-templates.html) for EC2 VM's in an Auto Scaling Group |
| [`aws_autoscaling_group`](https://registry.terraform.io/modules/terraform-aws-modules/autoscaling/aws/latest)             | Used to Group a collection of EC2 (VMs) for [easy (automatic) scaling and management](https://docs.aws.amazon.com/autoscaling/ec2/userguide/auto-scaling-groups.html) |
| [`aws_lb`](https://registry.terraform.io/modules/terraform-aws-modules/alb/aws/latest)                                    | [Application Load Balancer](https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html) |
| [`aws_lb_listener`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener)              | Adds a [Listener](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-listener.html) for the LB |
| [`aws_lb_target_group`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group)      | Sets the [Target Group](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/create-target-group.html) for the LB |
| [`aws_lb_listener_rule`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule)    | Adds a [Rule](https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-listeners.html#listener-rules) for the LB Listener |
## 

---
# AWS FAQ

- [AWS Regions, Availability Zones, and Local Zones](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html)

    - Europe (London) - `eu-west-2`

- AWS (Ubuntu) [Amazon EC2 AMI Locator](https://cloud-images.ubuntu.com/locator/ec2/)

    - [AMI Catalog](https://eu-west-2.console.aws.amazon.com/ec2/home?region=eu-west-2#AMICatalog:)
    - Ubuntu Server 22.04 LTS (HVM), SSD Volume Type
        - `ami-03ceeb33c1e4abcd1` (64-bit (x86))
        - `ami-086bdccec99d20c2a` (64-bit (Arm))