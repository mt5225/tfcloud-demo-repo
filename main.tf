locals {
  common_vars = {
    ansible_user = "ubuntu"
    pk_file      = "/assets/keys/snow.pem"
  }
}

##############################
# state for ansible 
##############################

resource "ansible_host" "web" {
  inventory_hostname = "web"
  groups             = ["web"]
  vars = merge(local.common_vars,
    {
      port = var.port
    }
  )
}

resource "ansible_host" "db" {
  inventory_hostname = "db"
  groups             = ["db"]
  vars = merge(local.common_vars,
    {
      version     = "5.6"
      environment = var.environment
    }
  )
}
