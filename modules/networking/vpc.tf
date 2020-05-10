locals {
	t			= "${timestamp()}"
}

resource "google_compute_network" "local_name_vpc" {
	name			= "${format("%s", "${var.company}-${var.env}")}-vpc"
	description		= "VPC created on ${formatdate("EEEE, MMM-DD-YYYY", local.t)} at ${formatdate("HH:mm aa", local.t)} UTC"
	auto_create_subnetworks = "false"
	routing_mode		= "GLOBAL"

	lifecycle {
		ignore_changes	= [
			description,
		]
	}
}
