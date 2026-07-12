# Resource group for the AKS cluster
resource "azurerm_resource_group" "rg" {
  name     = "${var.labelPrefix}-H09-RG"
  location = var.region
}

# Resolve the latest supported Kubernetes version in this region
data "azurerm_kubernetes_service_versions" "current" {
  location = azurerm_resource_group.rg.location
}

# Azure Kubernetes Service cluster
resource "azurerm_kubernetes_cluster" "app" {
  name                = "${var.labelPrefix}-H09-aks"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "${var.labelPrefix}-h09"
  kubernetes_version  = data.azurerm_kubernetes_service_versions.current.latest_version

  default_node_pool {
    name                = "default"
    vm_size             = "Standard_B2s"
    enable_auto_scaling = true
    min_count           = 1
    max_count           = 3
  }

  identity {
    type = "SystemAssigned"
  }
}
