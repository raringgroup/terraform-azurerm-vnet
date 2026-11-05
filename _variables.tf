## ----------------------------------------------------------------------------
## Copyright 2026 Raring Group LLC
##
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
##     http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
## ----------------------------------------------------------------------------
##
##  modules/vnet/_variables.tf
##
##  Input variables for the virtual network module.
## ----------------------------------------------------------------------------

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group that holds the virtual network"
}

variable "location" {
  type        = string
  description = "Azure region where the virtual network is created"
}

variable "address_space" {
  type        = list(string)
  description = "CIDR blocks that make up the virtual network address space"
}

variable "dns_servers" {
  type        = list(string)
  description = "Custom DNS server IP addresses; an empty list uses Azure-provided DNS"
}
