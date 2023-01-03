resource "azurerm_virtual_hub" "vhub" {
  name                = "vhub-${var.location}"
  resource_group_name = var.resource_group_name
  location            = var.location
  virtual_wan_id      = var.wan_id
  address_prefix      = var.prefix
  tags                = var.tags
}

resource "azurerm_firewall" "fw" {
  name                = "fw-${var.location}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_tier            = "Premium"
  sku_name            = "AZFW_Hub"
  firewall_policy_id  = var.firewall_policy_id
  tags                = var.tags

  virtual_hub {
    virtual_hub_id  = azurerm_virtual_hub.vhub.id
    public_ip_count = 1
  }
} // public ip optional?

# resource "azurerm_virtual_hub_route_table_route" "secure" {
#   route_table_id = azurerm_virtual_hub.vhub.default_route_table_id

#   name              = "all_traffic"
#   destinations_type = "CIDR"
#   destinations      = ["0.0.0.0/0","10.0.0.0/8","172.16.0.0/12","192.168.0.0/16"]
#   next_hop_type     = "ResourceId"
#   next_hop          = azurerm_firewall.fw.id
# }