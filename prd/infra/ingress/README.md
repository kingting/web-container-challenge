## Point terraform  to the environent
export KUBE_CONFIG_PATH=~/.kube/config

## Deploy using terraform
terraform init
terraform plan -out tfplan
terraform apply tfplan
terraform state list
