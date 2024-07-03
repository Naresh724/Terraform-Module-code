


### RG variables

variable "rg_name" {

}
variable "rg_location" {

}

variable "tags" {
    type = map(string)
    
}


### Vnet Variables

variable "vn_name" {

}

variable "vn_address_space" {

}


### Subnet Variables

variable "subnet_name" {

}

variable "subnet_address_prefixes" { 

}


### NSG Creation

variable "nsg_name" {

}



### Public ip variables

variable "pip_name" {

}

variable "pip_allocation_method" {

}

### Public ip 2 variables

variable "pip2_name" {

}


### Netowrk Interface Creation

variable "nic_name" {

}

variable "ip_config_name" {

}

variable "ip_config_private_ip_allocation" {

}

### Nic 2 creation

variable "nic2_name" {

}

variable "ip_config_name2" {

}



### Storage Account Variables

variable "storage_name" {

}

variable "storage_account_tier" {

}

variable "storage_account_replication_type" {

}

variable "storage_tags" {
    type = map(string)
}


### VM Variables

variable "vm_name" {

}

variable "vm_size" {

}

variable "vm_admin_username" {

}

variable "vm_admin_password" {

}

variable "vm_disable_password_authentication" {
    type = bool
}

variable "vm_caching" {

}

variable "vm_storage_account_type" {

}


### VM2 creation 

variable "vm2_name" {

}

