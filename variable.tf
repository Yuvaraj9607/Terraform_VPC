variable "name" {
  type = string
  default = "Terraform vpc"
}
variable "access_key" {
  default = "AKIA5MGJNN5VAOFGIMUX"
}
variable "secret_key" {
  default = "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"
}
variable "cidr_vpc" {
  
  default = "192.168.0.0/24"
}
variable "subpub1" {
  
  default = "192.168.1.0/24"
}
variable "subpub2" {
  
  default = "192.168.2.0/24"
}
variable "subpvt1" {

  default = "192.168.3.0/24"
}
variable "subpvt2" {
 
  default = "179.168.4.0/24"
}
variable "az_subnet1" {
  default = "ap-south-1a"
}
variable "az_subnet2" {
  default = "ap-south-1b"
}
