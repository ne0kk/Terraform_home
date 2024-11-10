output "out" {

    value=concat(module.marketing.fqdn , module.analytics.fqdn)
}
output "vpc_out" {

    value=concat(module.vpc_module.network_ids[*], module.vpc_module.subnet_id)
}
