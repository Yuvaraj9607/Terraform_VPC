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
  
  default = "172.0.0.0/24"
}
variable "subpub1" {
  
  default = "172.0.1.0/24"
}
variable "subpub2" {
  
  default = "172.0.2.0/24"
}
variable "subpvt1" {

  default = "172.0.3.0/24"
}
variable "subpvt2" {
 
  default = "172.0.4.0/24"
}
variable "az_subnet1" {
  default = "ap-south-1a"
}
variable "az_subnet2" {
  default = "ap-south-1b"
}
