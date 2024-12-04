variable "instances" {
  type        = map
  default     = {
    mysql = "t3.small"
    mongodb = "t3.small"
    rabbitmq = "t3.micro"
    redis = "t3.micro"
    catalogue = "t3.micro"
    cart = "t3.micro"
    user = "t3.micro"
    shipping = "t3.small"
    payments = "t3.micro"
    dispatch = "t3.micro"
    frontend = "t3.micro"
  }
}

variable "subnet_id" {
    default = "subnet-0ea509ad4cba242d7"
}

variable "allow_all" {
    default = "sg-0fea5e49e962e81c9"
}

variable "zone_id" {
    default = "Z09912121MS725XSKH1TG"
}

variable "domain_name" {
    default = "daws81s.online"
}