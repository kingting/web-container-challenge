## Point terraform  to the environent
export KUBE_CONFIG_PATH=~/.kube/config

## Deploy using terraform
~~~
terraform init
terraform plan -out tfplan
terraform apply tfplan
terraform state list
~~~

### Notes
~~~
Install route 53 secret key to allow letsencrypt DNS-01 challenge
Secret key need to be available in the environment variable for this to work
The key is not store in version control, TODO: secured the key elsewhere... 
~~~
