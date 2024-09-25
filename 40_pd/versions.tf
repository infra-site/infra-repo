terraform {
  required_providers {
    pagerduty = {
      source = "pagerduty/pagerduty"
    }
  }
  required_version = ">= 0.12"
}

# provider setting
## "Pagerduty_Token"
provider "pagerduty" {
  token = "u+eLUrDenQ3uAiGeYqeg"
}
module "pagerduty_service" {
  #source            = "git@github.com:hazelops/terraform-pagerduty-service.git"
  source            = https://github.com/infra-site/infra-repo/tree/main/40_pd
  enabled           = true
  acknowledgement_timeout = 10
  alert_creation  = "create_alerts_and_incidents"
  escalation_policy = module.pagerduty_escalation.id
  service_integration_name = "New Relic"
  service_name      = "dev_infra"
}