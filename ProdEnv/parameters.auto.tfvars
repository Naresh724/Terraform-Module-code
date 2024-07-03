

# ### RG Parameters
rg_name = "Prod-RG01"

rg_location = "eastus"

tags =  {
    "env" = "prod"
    "Owner" = "naresh"
}


### Vnet Parameters

vn_name = "prod-VN01"

vn_address_space = ["12.0.0.0/16"]


### Subnet Parameters

subnet_name = "prod-subnet1"
subnet_address_prefixes = ["12.0.1.0/24"]



### NSG Parameters

nsg_name = "prod-nsg1"



### Pip parameters

pip_name = "prod-pip1"
pip_allocation_method = "Static"

### Pip 2 parameters

pip2_name = "prod-pip2"



### Network_interface_parameters

nic_name = "prod-nic1"
ip_config_name = "prod-internal"
ip_config_private_ip_allocation = "Dynamic"

### NIC2 parameters

nic2_name = "prod-nic2"
ip_config_name2 = "external"




### Storage Account Parameters

storage_name = "prodsa01naresh"
storage_account_tier = "Standard"
storage_account_replication_type = "LRS"

storage_tags = {
    "env" = "prod"
}

### VM Parameters

vm_name = "prod-VM01"
vm_size = "Standard_B1ls"
vm_admin_username = "naresh"
vm_admin_password = "Burrynaresh724#"
vm_disable_password_authentication = false
vm_caching = "ReadWrite"
vm_storage_account_type = "Standard_LRS"


### VM2 parameters

vm2_name = "prod-VM02"

