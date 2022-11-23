# web-container with supporting services
- Web server container to host an app from a git repo
- Supporting services
- Structure for easy CI/CD pipelines integration

## Infrastructure and related containers to deploy a weather app with observability

### infrastructure components
* kops: scripts to build a kubernetes cluster in AWS
* traefik : container provide ingress service
* cert-manager : container to manage and issuer Letsencrypt certificates
* kube-prometheus-stack : container to provide application  monitoring and observability

### Application components
* apache: container to provide web server

## Strategies to use separate directories and reusable modules to create multiple environments

### Environments
* dev (tested working)
 * infra/
   * kubernetes cluster : using existing cluster on local machine
   * ingress : Load Balancer and ingress service
   * monitor : Application observability
   * cert-manager : SSL certificate issuer service
 * weather/
   * webserver container with application clone from github
 * Access
   * https://weather.batsc.com.au
   * https://monitor.batsc.com.au (User name and password given separately)
* test ...
* stg ...
* prd/ (not fully tested) 
 * infra/
   * kops : AWS kubernetes cluster
   * ingress : Load Balancer and ingress service
   * monitor : Application observability
   * cert-manager : SSL certificate issuer service
 * weather/
   * webserver container with application clone from github

### Reusable modules
* modules/
  * using terraform registry release helm : https://registry.terraform.io/modules/terraform-module/release/helm/latest
