output "url" {
  value = "${format("https://%s", "${module.cloudfrount_distribution.output_domain_name}")}"
}
