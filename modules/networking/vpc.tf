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

resource "google_compute_firewall" "allow_internal" {
	name			= "${format("%s", "${var.company}-${var.env}")}-fw-allow-internal"
	network			= google_compute_network.local_name_vpc.name
	allow {
		protocol	= "icmp"
	}
	allow {
		protocol	= "tcp"
		ports		= ["0-65535"]
	}
	allow {
		protocol	= "udp"
		ports		= ["0-65535"]
	}
	source_ranges		= [
		var.public_subnet_cidr,
		var.private_subnet_cidr
	]
}

resource "google_compute_firewall" "allow_http" {
	name                    = "${format("%s", "${var.company}-${var.env}")}-fw-allow-http"
        network                 = google_compute_network.local_name_vpc.name
	allow {
		protocol        = "tcp"
                ports           = ["80"]
	}
	target_tags		= ["http"]
}

resource "google_compute_firewall" "allow_ssh" {
	name                    = "${format("%s", "${var.company}-${var.env}")}-fw-allow-ssh"
        network                 = google_compute_network.local_name_vpc.name
	allow {
		protocol        = "tcp"
                ports           = ["22"]
	}
	target_tags		= ["ssh"]
}
