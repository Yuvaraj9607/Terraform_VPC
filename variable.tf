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
  
  default = "10.0.0.0/16"
}
variable "subpub1" {
  
  default = "10.0.5.0/24"
}
variable "subpub2" {
  
  default = "10.0.6.0/24"
}
variable "subpvt1" {

  default = "10.0.7.0/24"
}
variable "subpvt2" {
 
  default = "10.0.8.0/24"
}
variable "az_subnet1" {
  default = "ap-southeast-1a"
}
variable "az_subnet2" {
  default = "ap-southeast-1b"
}
