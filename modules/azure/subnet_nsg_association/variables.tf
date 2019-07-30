variable "nsg_id" {
  description = "(Required) The ID of the Network Security Group which should be associated with the Subnet."
  type        = "string"
  default     = ""
}

variable "subnet_id" {
  description = "(Required) The ID of the Subnet."
  type        = "string"
  default     = ""
}