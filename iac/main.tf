terraform {
  required_providers {
    azurerm = "~> 2.33"
    azuread = "~>2.0"
  }

  backend "azurerm" {
  }
}

provider "azurerm" {
  features {}
}

variable "app_name" {
  default   = "adls2"
  type      = string
  sensitive = false
}

variable "env" {
  default   = "demo"
  sensitive = false
}

variable "location" {
  default   = "East US 2"
  sensitive = false
  type      = string
}

variable "tags" {
  type = map(string)

  default = {
    environment = "demo"
    workload    = "crypto-analytics"
  }
}

variable "admin_user_principal_name" {
  type        = string
  sensitive   = true
  description = "The user principal name of the admin for the app."
}

locals {
  loc            = lower(replace(var.location, " ", ""))
  a_name         = replace(var.app_name, "-", "")
  fqrn           = "${var.app_name}-${var.env}-${local.loc}"
  fqrn_condensed = "${length(local.a_name) > 22 ? substr(local.a_name, 0, 22) : local.a_name}${substr(local.loc, 0, 1)}${substr(var.env, 0, 1)}"
  rg_name        = local.fqrn
}

data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "rg" {
  name = local.rg_name
}

data "azuread_user" "admin" {
  user_principal_name = var.admin_user_principal_name
}