#  # Create a cluster in AWS in a single zone.
#  kops create cluster --name=k8s-cluster.example.com \
#  --state=s3://my-state-store \
#  --zones=us-east-1a \
#  --node-count=2

  # Create a cluster in AWS with High Availability masters. This cluster
  # has also been configured for private networking in a kops-managed VPC.
  # The bastion flag is set to create an entrypoint for admins to SSH.
  export KOPS_STATE_STORE="s3://kube-ocoo-au"
  export MASTER_SIZE="c5.large"
  export NODE_SIZE="m5.large"
  export ZONES="ap-southeast-2a,ap-southeast-2b,ap-southeast-2c"
  kops create cluster kube.ocoo.au \
  --node-count 3 \
  --zones $ZONES \
  --node-size $NODE_SIZE \
  --master-size $MASTER_SIZE \
  --master-zones $ZONES \
  --networking cilium \
  --topology private \
  --bastion="true" \
  --dry-run \
  -oyaml > cluster.yaml
#  --yes

#  # Generate a cluster spec to apply later.
#  # Run the following, then: kops create -f filename.yaml
#  kops create cluster --name=k8s-cluster.example.com \
#  --state=s3://my-state-store \
#  --zones=us-east-1a \
#  --node-count=2 \
#  --dry-run \
#  -oyaml > filename.yaml
