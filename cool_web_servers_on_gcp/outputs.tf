output "self_link_of_vpc_created" {
        value           = module.vpc_for_my_web_servers.vpc_self_link
}

output "id_of_vpc_created" {
        value           = module.vpc_for_my_web_servers.vpc_id
}

output "gateway_ipv4_of_vpc_created" {
        value           = module.vpc_for_my_web_servers.vpc_gateway_ipv4
}
