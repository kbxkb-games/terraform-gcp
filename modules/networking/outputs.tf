output "vpc_self_link" {
        value           = google_compute_network.local_name_vpc.self_link
}

output "vpc_id" {
	value		= google_compute_network.local_name_vpc.id
}

output "vpc_gateway_ipv4" {
	value		= google_compute_network.local_name_vpc.gateway_ipv4
}
