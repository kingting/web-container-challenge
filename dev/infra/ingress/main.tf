resource "kubernetes_namespace" "traefik" {
  metadata {
    annotations = {
      name = "traefik"
    }

    labels = {
      name = "traefik"
    }

    name = "traefik"
  }
}
module traefik {
  source = "terraform-module/release/helm"
  version = "2.6.0"
  namespace = "traefik"
  repository = "https://helm.traefik.io/traefik"
  app = {
    name = "traefik"
    version = "20.1.1"
    chart = "traefik"
    force_update = true
    wait = false
    recreate_pods = false
    deploy = 1
  }
  values = [file("values.yaml")]

  set = [
    {
      name  = "service.annotations.purelb\\.io/service-group"
      value = "dev"
    },
  ]
}
