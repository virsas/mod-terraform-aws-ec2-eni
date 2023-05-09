# Account setup
variable "profile" {
  description           = "The profile from ~/.aws/credentials file used for authentication. By default it is the default profile."
  type                  = string
  default               = "default"
}

variable "accountID" {
  description           = "ID of your AWS account. It is a required variable normally used in JSON files or while assuming a role."
  type                  = string

  validation {
    condition           = length(var.accountID) == 12
    error_message       = "Please, provide a valid account ID."
  }
}

variable "region" {
  description           = "The region for the resources. By default it is eu-west-1."
  type                  = string
  default               = "eu-west-1"
}

variable "assumeRole" {
  description           = "Enable / Disable role assume. This is disabled by default and normally used for sub organization configuration."
  type                  = bool
  default               = false
}

variable "assumableRole" {
  description           = "The role the user will assume if assumeRole is enabled. By default, it is OrganizationAccountAccessRole."
  type                  = string
  default               = "OrganizationAccountAccessRole"
}

variable "name" {
  description = "Name of the interface in AWS console. Required value"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where to create the ENI in. Required value."
  type        = string
}
variable "private_ips_count" {
  description = "Number of private IPs attached to this interface. In case you use this value, you cannot specify what IPs to attache. If you want to specify exactly what IP address from the subnet to choose, please use private_ips variable instead."
  type        = number
  default     = 0
}
variable "private_ips" {
  description = "Specify exactly what IPs to attached to the interface. Used if the private_ips_count is set to 0. Eg.: [10.0.0.5, 10.0.0.6]. AWS might limit the number of attached IPs to specific EC2 instances"
  type        = list(string)
  default     = []
}
variable "security_groups" {
  description = "List of security groups attached to this ENI"
  type        = list(string)
  default     = []
}
variable "attach" {
  description = "Enable or disable the attachment to an instance. If enabled, instance must be provided. Defaults to false."
  type        = bool
  default     = false
}
variable "instance" {
  description = "Instance to attach the network interface to."
  type        = string
  default     = ""
}
variable "device_index" {
  description = "Network interface index when attached to an instance. In case only one device is attached, default value set to 0 does not need to be changed."
  type        = number
  default     = 0
}