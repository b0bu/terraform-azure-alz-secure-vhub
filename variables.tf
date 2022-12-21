variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "wan_id" {
  type = string
}

variable "prefix" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "firewall_policy_id" {
    type = string
}