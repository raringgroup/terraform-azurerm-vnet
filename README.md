# vnet

Creates one Azure virtual network, named and tagged through the SevenPico context module. Subnets are created by the `subnets` module.

## Requirements

| Name | Version |
|------|---------|
| terraform | `>= 1.3.0` |
| azurerm | `>= 4.0.0, < 5.0.0` |

## Module Priority

No SevenPico, SevenPicoForks or CloudPosse module exists for Azure virtual networks, so the module uses `azurerm_virtual_network` directly. Naming, tags and the enabled flag come from the context module. `_context.tf` declares the root context (`SevenPico/context/null` `2.0.0`); child contexts use the local `../null-context` module.

## Inputs

All inputs are required (no defaults). Context inputs (`enabled`, `namespace`, `environment`, `stage`, `name`, `attributes`, `tags`, ...) are declared in `_context.tf`.

| Name | Type | Description |
|------|------|-------------|
| resource_group_name | `string` | Resource group that holds the virtual network |
| location | `string` | Azure region where the virtual network is created |
| address_space | `list(string)` | CIDR blocks that make up the address space |
| dns_servers | `list(string)` | Custom DNS server IPs; an empty list uses Azure-provided DNS |

## Outputs

| Name | Description |
|------|-------------|
| id | Virtual network ID (null when disabled) |
| name | Virtual network name (null when disabled) |
| address_space | Virtual network address space (null when disabled) |

## Usage

```hcl
terraform {
  source = "git::<repo-url>//modules/vnet?ref=vnet-v<version>"
}

dependency "resource_group" {
  config_path = "../resource-group"
}

inputs = {
  enabled     = true
  namespace   = "<namespace>"
  environment = "<environment>"
  stage       = "<stage>"
  name        = "<name>"

  address_space       = ["<cidr>"]
  dns_servers         = []
  location            = dependency.resource_group.outputs.location
  resource_group_name = dependency.resource_group.outputs.name
}
```

## License

Apache License 2.0. Copyright 2026 Raring Group LLC.
