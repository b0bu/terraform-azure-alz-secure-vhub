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


