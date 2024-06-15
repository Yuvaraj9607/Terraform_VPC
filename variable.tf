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
  
  default = "172.0.0.0/16"
}
variable "subpub1" {
  
  default = "172.1.0.0/16"
}
variable "subpub2" {
  
  default = "172.2.0.0/16"
}
variable "subpvt1" {

  default = "172.3.0.0/16"
}
variable "subpvt2" {
 
  default = "172.4.0.0/16"
}
variable "az_subnet1" {
  default = "ap-south-1a"
}
variable "az_subnet2" {
  default = "ap-south-1b"
}
