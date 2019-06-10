variable "vpc_id"  {
    description = "VPC ID for spoke - Generated by VPC Module"
    default = ""
}

variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {}
}

variable "name" {
  description = "Name to be used on all the resources as identifier"
  default     = ""
}

variable "prefix"  {
    description = "Prefix for route to add to table"
    default = ""
}

variable "vgw_next_hop" {
  description = "VGW ID to be used as next-hop for route"
  default     = ""
}

variable "igw_next_hop" {
  description = "IGW ID to be used as next-hop for route"
  default     = ""
}

variable "tgw_next_hop" {
  description = "TGW ID to be used as next-hop for route"
  default     = ""
}

variable "eni_next_hop" {
  description = "ENI ID to be used as next-hop for route"
  default     = ""
}

variable "create_route_to_vgw" {
  description = "Used for count to determine which resource to used based on next-hop type"
  default     = ""
}

variable "create_route_to_igw" {
  description = "Used for count to determine which resource to used based on next-hop type"
  default     = ""
}

variable "create_route_to_tgw" {
  description = "Used for count to determine which resource to used based on next-hop type"
  default     = ""
}

variable "create_route_to_eni" {
  description = "Used for count to determine which resource to used based on next-hop type"
  default     = ""
}