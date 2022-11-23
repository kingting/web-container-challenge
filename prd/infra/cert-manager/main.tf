resource "kubernetes_namespace" "cert-manager" {
  metadata {
    annotations = {
      name = "cert-manager"
    }

    labels = {
      name = "cert-manager"
    }

    name = "cert-manager"
  }
}
module apache {
  source = "terraform-module/release/helm"
  version = "2.6.0"
  namespace = "cert-manager"
  repository = "https://charts.jetstack.io"
  app = {
    name = "cert-manager"
    version = "v1.10.0"
    chart = "cert-manager"
    force_update = true
    wait = false
    recreate_pods = false
    deploy = 1
  }
  values = [file("values.yaml")]

  set = [
    {
      name  = "installCRDs"
      value = "true"
    },
  ]
}
