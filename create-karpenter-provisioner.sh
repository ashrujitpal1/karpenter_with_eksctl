# SH file to create the cluster

# Store the Karpenter version into an Environment variable
export KARPENTER_VERSION=v0.8.0

# Store the Cluster Name, Region and ACCOUNT Id
export CLUSTER_NAME="admcoe-karpenter-demo"
export AWS_DEFAULT_REGION="us-east-1"
export AWS_ACCOUNT_ID="$(aws sts get-caller-identity --query Account --output text)"

# Create the cluster with the configurations specified into eks-cluster.yml and using command 'eksctl'
# The cluster is created into an already created VPC with public and private subnets
rm -f final.yml temp.yml
( echo "cat <<EOF >final.yml";
  cat karpenter-provisioner.yml;
) >temp.yml
. temp.yml

TEMPOUT=$(mktemp)
cat final.yml > $TEMPOUT
kubectl apply -f $TEMPOUT


