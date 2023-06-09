terraform {
  cloud {
    organization = "harshit-rawat-devops"

    workspaces {
      name = "terransible"
    }
  }
}