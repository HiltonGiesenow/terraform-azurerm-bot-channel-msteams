# terraform_bot_channel_msteams

A module to add the MS Teams channel to a Microsoft Azure Bot. This is a hopefully just a workaround until the functionality exists in Terraform itself (possible via PR https://github.com/terraform-providers/terraform-provider-azurerm/pull/4984)

## Limitations

1. You need a valid session in the Azure CLI (even when you are Authenticating terrafrom not with the Azure CLI) because the CLI is used under the covers
2. A change outside from terrafrom is not detect and a reapply will not fix this.

## Example

```terraform
resource "azurerm_bot_channels_registration" "MyBot" {
	name                = "MyBot"
	resource_group_name = azurerm_resource_group.test.name
	location            = "global"
	sku                 = "F0"
	microsoft_app_id    = var.myBotAppId
	endpoint			= "https://my.bot.com/api/messages"
}

module "bot_channel_msteams" {
	source              = "bot_channel_msteams"
	resource_group_name = azurerm_resource_group.test.name
    bot_name 			= "MyBot"
	module_depends_on 	= ["${azurerm_bot_channels_registration.MyBot}"]
}
```
