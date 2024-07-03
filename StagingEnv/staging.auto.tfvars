

# ### RG Parameters
rg_name = "RG01"

rg_location = "eastus"

env = "Staging"

Business_unit = "BAU"



### Vnet Parameters

vn_name = "Staging-VN01"

vn_address_space = ["11.0.0.0/16"]


### Subnet Parameters

subnet_name = "Staging-subnet1"
subnet_address_prefixes = ["11.0.1.0/24"]



### NSG Parameters

nsg_name = "Staging-nsg1"



### Pip parameters

pip_name = "Staging-pip1"
pip_allocation_method = "Static"

### Pip 2 parameters

pip2_name = "Staging-pip2"



### Network_interface_parameters

nic_name = "Staging-nic1"
ip_config_name = "Staging-internal"
ip_config_private_ip_allocation = "Dynamic"

### NIC2 parameters

nic2_name = "Staging-nic2"
ip_config_name2 = "external"




### Storage Account Parameters

storage_name = "stagingsa01naresh"
storage_account_tier = "Standard"
storage_account_replication_type = "LRS"

storage_tags = {
    "env" = "staging"
}

### VM Parameters

vm_name = "Staging-VM01"
vm_size = "Standard_B1ls"
vm_admin_username = "naresh"
vm_admin_password = "Burrynaresh724#"
vm_disable_password_authentication = false
vm_caching = "ReadWrite"
vm_storage_account_type = "Standard_LRS"


### VM2 parameters

vm2_name = "VM02"

