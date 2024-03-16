data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "kravcov"
    workspaces = {
      name = "vpc"
    }
  }
}
