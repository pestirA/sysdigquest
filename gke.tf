



# Create the GKE cluster
resource "google_container_cluster" "my-sysdig-west-cluster" {
  name     = "my-sysdig-west-cluster"
  location = var.location
  //deletion_protection = false

  # Add other cluster configuration here.
  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name

}

# Separately Managed Node Pool
resource "google_container_node_pool" "my-sysdig-west-cluster" {
  name       = "my-sysdig-node-pool"
  location   = var.location
  cluster    = google_container_cluster.my-sysdig-west-cluster.name
  node_count = 1

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only"
    ]

    labels = {
      env = var.PROJECT_ID
    }

    # preemptible  = true
    machine_type = "e2-standard-4" //"e2-micro"
    //tags         = ["gke-node", "${var.PROJECT_ID}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}

/*Run a null resource to setup context and also get the cluster credentials in kube config?*/
resource "null_resource" "kube-context" {

  provisioner "local-exec" {
    working_dir = path.module
    command     = <<EOT
    gcloud container clusters get-credentials ${var.name} --region ${var.region} --project ${var.PROJECT_ID}
    kubectl config set-context --current --namespace=default

   EOT
  }
  depends_on = [google_container_node_pool.my-sysdig-west-cluster]
}

/*Run a null resource to deploy the voting up to the clustert in us-west1*/
resource "null_resource" "deploy-k8s-secifications" {

  provisioner "local-exec" {
    working_dir = path.module
    command     = <<EOT
    gcloud container clusters get-credentials my-sysdig-west-cluster --zone us-west1
    #cd k8s-specifications
    kubectl create -f k8s-specifications/
   EOT
  }
  depends_on = [google_container_node_pool.my-sysdig-west-cluster]
}

/*Deploy the agents to the sysdig clusterin us-west1*/
/*
resource "null_resource" "deploy-sysdig-agent" {

  provisioner "local-exec" {
    working_dir = path.module
    command     = <<EOT
    gcloud container clusters get-credentials my-sysdig-west-cluster --zone us-west1
    #cd k8s-specifications
    kubectl create -f k8s-specifications/
   EOT
  }
  depends_on = [google_container_node_pool.my-sysdig-west-cluster]
}*/