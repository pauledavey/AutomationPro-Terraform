terraform {
  backend "remote" {
    organization = "AutomationPro"

    workspaces {
      name = "vSphere-automationpro-production-env"
    }
  }
}