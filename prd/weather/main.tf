module apache {
  source = "terraform-module/release/helm"
  version = "2.6.0"
  namespace = "apps"
  repository = "https://charts.bitnami.com/bitnami"
  app = {
    name = "apache"
    version = "9.2.7"
    chart = "apache"
    force_update = true
    wait = false
    recreate_pods = false
    deploy = 1
  }
  values = [file("values.yaml")]

  set = [
    {
      name  = "cloneHtdocsFromGit.enabled"
      value = "true"
    },
    {
      name  = "ingress.hostname"
      value = "weather.batsc.com.au"
    },
  ]
}
