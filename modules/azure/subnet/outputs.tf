output "azurerm_subnet_name" {
  description = "names of subnet"
  value = "${azurerm_subnet.subnet.name}"
}

output "azurerm_subnet_id" {
  description = "Subnet ID"
  value = "${azurerm_subnet.subnet.id}"
}