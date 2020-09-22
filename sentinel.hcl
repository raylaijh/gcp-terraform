policy "gcp-cis-7.1-kubernetes-ensure-stackdriver-logging-is-set-to-enabled-on-kubernetes-engine-clusters" {
   source = "https://raw.githubusercontent.com/hashicorp/terraform-foundational-policies-library/master/cis/gcp/kubernetes/>gcp-cis-7.1-kubernetes-ensure-stackdriver-logging-is-set-to-enabled-on-kubernetes-engine-clusters/gcp-cis-7.>1-kubernetes-ensure-stackdriver-logging-is-set-to-enabled-on-kubernetes-engine-clusters.sentinel"
   enforcement_level = "advisory"
}

policy "gcp-cis-7.2-kubernetes-ensure-stackdriver-monitoring-is-set-to-enabled-on-kubernetes-engine-clusters" {
   source = "https://raw.githubusercontent.com/hashicorp/terraform-foundational-policies-library/master/cis/gcp/kubernetes/>gcp-cis-7.2-kubernetes-ensure-stackdriver-monitoring-is-set-to-enabled-on-kubernetes-engine-clusters/gcp-cis-7.>2-kubernetes-ensure-stackdriver-monitoring-is-set-to-enabled-on-kubernetes-engine-clusters.sentinel"
   enforcement_level = "advisory"
}

policy "gcp-cis-7.3-kubernetes-ensure-legacy-authorization-is-set-to-disabled-on-kubernetes-engine-clusters" {
   source = "https://raw.githubusercontent.com/hashicorp/terraform-foundational-policies-library/master/cis/gcp/kubernetes/>gcp-cis-7.3-kubernetes-ensure-legacy-authorization-is-set-to-disabled-on-kubernetes-engine-clusters/gcp-cis-7.>3-kubernetes-ensure-legacy-authorization-is-set-to-disabled-on-kubernetes-engine-clusters.sentinel"
   enforcement_level = "advisory"
}
