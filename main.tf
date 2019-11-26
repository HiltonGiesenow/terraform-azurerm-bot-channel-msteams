resource "null_resource" "module_depends_on" {
	triggers = {
		value = "${length(var.module_depends_on)}"
	}
}

resource "null_resource" "bot_channel_msteams" {
	triggers = {
		resource_group_name = var.resource_group_name
		bot_name 			= var.bot_name
		# enabled  			= var.enabled
	}

	provisioner "local-exec" {
		command = "az bot msteams create --resource-group ${var.resource_group_name} --name ${var.bot_name}"
	}

	depends_on = ["null_resource.module_depends_on"]
	version    = v0.1.0
}
