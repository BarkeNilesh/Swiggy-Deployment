variable "ports" {
  type    = list(number)
  default = [22, 80, 443, 8080, 9000, 3000, 6443, 8443, 3000]
}

variable "image_id" {
  type    = string
  default = "ami-0dee22c13ea7a9a67"

}

variable "instance_type" {
  type    = string
  default = "t3.micro"

}

variable "access_key" {
  type    = string
  default = ""
}

variable "secret_key" {
  type    = string
  default = ""
}