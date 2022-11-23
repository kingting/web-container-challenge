## Create a route53 hosted zone

if [ "$#" -lt 1  ] 
then 
 echo "Usage: $0 <domain name> "
 exit 1
fi
DOMAIN_NAME=$1

ID=$(uuidgen) && \
aws route53 create-hosted-zone \
--name $DOMAIN_NAME \
--caller-reference $ID \
| jq .DelegationSet.NameServers
