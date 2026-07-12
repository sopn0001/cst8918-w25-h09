variable "labelPrefix" {
  type        = string
  description = "Your college username. This will form the beginning of various resource names."
}

variable "region" {
  type        = string
  description = "Azure region for all resources."
  default     = "canadacentral"
}
