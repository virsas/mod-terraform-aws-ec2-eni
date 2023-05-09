# mod-terraform-aws-ec2-eni

Terraform module to create AWS EC2 Network Interface

## Variables

- **profile** - The profile from ~/.aws/credentials file used for authentication. By default it is the default profile.
- **accountID** - ID of your AWS account. It is a required variable normally used in JSON files or while assuming a role.
- **region** - The region for the resources. By default it is eu-west-1.
- **assumeRole** - Enable / Disable role assume. This is disabled by default and normally used for sub organization configuration.
- **assumableRole** - The role the user will assume if assumeRole is enabled. By default, it is OrganizationAccountAccessRole.

- **name** - Name of the interface in AWS console. Required value
- **subnet_id** - Subnet ID where to create the ENI in. Required value.
- **private_ips_count** - Number of private IPs attached to this interface. In case you use this value, you cannot specify what IPs to attache. If you want to specify exactly what IP address from the subnet to choose, please use private_ips variable instead.
- **private_ips** - Specify exactly what IPs to attached to the interface. Used if the private_ips_count is set to 0. Eg.: [10.0.0.5, 10.0.0.6]. AWS might limit the number of attached IPs to specific EC2 instances
- **security_groups** - List of security groups attached to this ENI
- **attach** - Enable or disable the attachment to an instance. If enabled, instance must be provided. Defaults to false.
- **instance** - Instance to attach the network interface to.
- **device_index** - Network interface index when attached to an instance. In case only one device is attached, default value set to 0 does not need to be changed.

## Example

### With own key
``` terraform
variable accountID { default = "123456789012"}

module "ec2_eni_instance1 {
  source   = "git::https://github.com/virsas/mod-terraform-aws-ec2-eni.git?ref=v1.0.0"

  profile = "default"
  accountID = var.accountID
  region = "eu-west-1"

  subnet            = "instance1"
  private_ips       = ["10.1.0.5"]
  security_groups   = [data.terraform_remote_state.vpc.outputs.vpc_sg_admin_id, data.terraform_remote_state.vpc.outputs.vpc_sg_example_id]

  attach            = true
  instance          = module.ec2_instance1.id
  device_index      = 0
}

```

## Outputs

- id
- arn
- mac_address
- private_dns_name
- instance_id
- network_interface_id
- attachment_id
- status
