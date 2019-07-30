variable "subnet_name" {
  description = "Subnet Name to be created"
  type        = "string"
  default     = ""
}

variable "vnet_name" {
  description = "Name of vNet to Deploy Subnet into"
  type        = "string"
  default     = ""
}

variable "subnet_prefix" {
  description = "Subnet Prefix to be generated"
  type        = "string"
  default     = ""
}

variable "resource_group_name" {
  type        = "string"
  default     = "mainrg"
}

variable "nsg_id" {
  type    = "string"
  default = ""
}

variable "mgmt_subnet" {
  type = "string"
  default = ""
}