output "vhub_id" {
    value = azurerm_virtual_hub.vhub.id
}

output "default_route_table_id" {
    value = azurerm_virtual_hub.vhub.default_route_table_id
}

output "firewall_id" {
    value = azurerm_firewall.fw.id
}