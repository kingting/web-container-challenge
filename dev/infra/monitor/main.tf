resource "kubernetes_namespace" "monitor" {
  metadata {
    annotations = {
      name = "monitor"
    }

    labels = {
      name = "monitor"
    }

    name = "monitor"
  }
}
module kube-prometheus {
  source = "terraform-module/release/helm"
  version = "2.6.0"
  namespace = "monitor"
  repository = "https://prometheus-community.github.io/helm-charts"
  app = {
    name = "kube-prometheus"
    version = "41.7.4"
    chart = "kube-prometheus-stack"
    force_update = true
    wait = false
    recreate_pods = false
    deploy = 1
  }
  values = [file("values.yaml")]

  set = [
    {
      name  = "grafana.adminPassword"
      value = "prometheus-operator-333"
    },
  ]
}
