variable "resource_group_name" {
  type        = string
}

variable "bot_name" {
  type        = string
  description = "The name of the bot in the respective resource group for which you want to enable the MsTeams channel"
}

variable "module_depends_on" {
  default = [""]
}

# variable "enabled" {
#   type        = bool
#   default     = true
#   description = "Enables or disables the MsTeams channel"
# }