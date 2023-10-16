terraform {
  required_providers {
    sysdig = {
      source = "sysdiglabs/sysdig"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}
/*terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}
*/
provider "sysdig" {
  sysdig_secure_url       = "https://app.us4.sysdig.com"
  sysdig_secure_api_token = "bf272c11-f8ed-4e6f-ad03-00451d99f722"
}

provider "google" {
  project = "humble-being-293400"
  region  = "us-west1"
}

provider "google-beta" {
  project = "humble-being-293400"
  region  = "us-west1"
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

module "single-project" {
  source = "sysdiglabs/secure-for-cloud/google//examples/single-project"
}

