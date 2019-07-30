
# resource "azurerm_resource_group" "vm" {
#   name     = "${var.resource_group_name}"
#   location = "${var.location}"
# }

# ********** VM PUBLIC IP ADDRESSES FOR MANAGEMENT **********

# Create the public IP address
resource "azurerm_public_ip" "pip" {
    name                            = "${var.generel_int_name}-publicIP"
    location                        = "${var.location}"
    resource_group_name             = "${var.resource_group_name}"
    public_ip_address_allocation    = "static"
    sku								              = "Standard"
    tags                            = {displayname = "${join("", list("PublicNetworkinterfaces", ""))}"}
}

# ********** NSG for the Public IP **********

# Create NSG
resource "azurerm_network_security_group" "open" {
  name                	= "${var.generel_int_name}-nsg"
  location            	= "${var.location}"
  resource_group_name 	= "${var.resource_group_name}"

# Create Security Rules

  security_rule {
    name                       = "Deafult-Allow-Inside"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "10.0.0.0/8"
    destination_address_prefix = "*"
  }
}

# ********** VM NETWORK INTERFACES **********

# Create the network interfaces
resource "azurerm_network_interface" "Management" {
    name                                = "${var.generel_int_name}-PAN-Mgmt"
    location                            = "${var.location}"
    resource_group_name                 = "${var.resource_group_name}"
    
    ip_configuration {
        name                            = "${var.generel_int_name}-ip-0"
        subnet_id                       = "${var.vnet_subnet_id_mgmt}"
        private_ip_address_allocation     = "static"
        public_ip_address_id = "${azurerm_public_ip.pip.id}"
    }
    network_security_group_id = "${azurerm_network_security_group.open.id}"
}


# ********** VIRTUAL MACHINE CREATION **********

# Create the virtual machine. Use the "count" variable to define how many
# to create.
resource "azurerm_virtual_machine" "panorama" {
    name                          = "${var.generel_int_name}"
    location                      = "${var.location}"
    resource_group_name           = "${var.resource_group_name}"
    network_interface_ids         = ["${azurerm_network_interface.Management.id}"]
    vm_size                       = "${var.pan_size}"

    delete_os_disk_on_termination = true
  
  storage_image_reference {
    publisher   = "${var.pan_publisher}"
    offer       = "${var.pan_series}"
    sku         = "${var.pan_sku}"
    version     = "${var.pan_version}"
  }
 
  plan {
    name        = "${var.pan_sku}"
    product     = "${var.pan_series}"
    publisher   = "${var.pan_publisher}"
      }

    storage_os_disk {
        name                = "${var.generel_int_name}-os-disk"
        caching             = "ReadWrite"
        create_option       = "FromImage"
        managed_disk_type   = "Premium_LRS"
    }

    os_profile     {
        computer_name     = "${var.pan_hostname}"
        admin_username    = "${var.adminUsername}"
        admin_password    = "${var.adminPassword}"
    }
    
    os_profile_linux_config {
    disable_password_authentication = false
  }
}
