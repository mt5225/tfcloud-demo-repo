terraform {
  backend "consul" {
    address = "localhost:8500"
    scheme  = "http"
    path    = "tf/tfcloud-demo-repo/terraform.tfstate"
    lock    = true
    gzip    = false
  }
}
