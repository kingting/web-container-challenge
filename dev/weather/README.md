## Pointing terraform to the appropriate environment
export KUBE_CONFIG_PATH=~/.kube/config

## Deploy using terraform
terraform init
terraform plan -out tfplan
terraform apply tfplan

## Remove the deployment
terraform destroy
