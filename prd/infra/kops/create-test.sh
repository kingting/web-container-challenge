 kops create cluster --name=kube.ocoo.au \
  --state=s3://kube-ocoo-au \
  --zones=ap-southeast-2a \
  --networking cilium \
  --node-count=2 \
  --bastion="true" \
  --topology private \
  --dry-run \
  -oyaml > test-cluster.yaml
