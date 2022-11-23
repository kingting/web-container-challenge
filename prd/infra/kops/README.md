#brew update && brew install kops

##

curl -Lo kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-darwin-amd64
chmod +x kops
sudo mv kops /usr/local/bin/kops

## Setup IAM user
./setup-iam-user.sh

# configure the aws client to use your new IAM user
export AWS_PROFILE=kops
aws configure           # Use your new access and secret key here
aws iam list-users      # you should see a list of all your IAM users here

# Because "aws configure" doesn't export these vars for kops to use, we export them now
export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)
export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)

## Create a hosted zone in route53
./hosted-zone.sh

## Create a s3 bucket
#aws s3api create-bucket --bucket kube-ocoo-au --create-bucket-configuration LocationConstraint=ap-southeast-2
aws s3 mb s3://kube-ocoo-au --region ap-southeast-2 --profile kops

### Version the s3 bucket
aws s3api put-bucket-versioning --bucket kube-ocoo-au --versioning-configuration Status=Enabled
export KOPS_STATE_STORE=s3://kube-ocoo-au

kops create cluster --name kube.ocoo.au --zones ap-southeast-2a --state s3://kube-ocoo-au --yes

kops delete cluster --name kube.ocoo.au --state s3://kube-ocoo-au --yes
