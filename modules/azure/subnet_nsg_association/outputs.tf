output "azurerm_subnet_network_security_group_association_subnet_id" {
  description = "Subnet ID"
  value = "${azurerm_subnet_network_security_group_association.subnet_nsg_association.id}"
}