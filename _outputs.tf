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
##  modules/vnet/_outputs.tf
##
##  Output values for the virtual network module.
## ----------------------------------------------------------------------------

output "id" {
  description = "Virtual network ID (null when disabled)"
  value       = try(azurerm_virtual_network.this[0].id, null)
}

output "name" {
  description = "Virtual network name (null when disabled)"
  value       = try(azurerm_virtual_network.this[0].name, null)
}

output "address_space" {
  description = "Virtual network address space (null when disabled)"
  value       = try(azurerm_virtual_network.this[0].address_space, null)
}
