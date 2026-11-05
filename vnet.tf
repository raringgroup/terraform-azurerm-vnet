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
##  modules/vnet/vnet.tf
##
##  Azure virtual network named and tagged from the context module.
##  Subnets are managed by the subnets module, not inline.
## ----------------------------------------------------------------------------

## Virtual Network Context
module "vnet_context" {
  source  = "../null-context"
  context = module.context.self

  attributes = ["vnet"]
}


## Virtual Network
resource "azurerm_virtual_network" "this" {
  count = module.vnet_context.enabled ? 1 : 0

  address_space       = var.address_space
  dns_servers         = length(var.dns_servers) > 0 ? var.dns_servers : null
  location            = var.location
  name                = module.vnet_context.id
  resource_group_name = var.resource_group_name
  tags                = module.vnet_context.tags
}
