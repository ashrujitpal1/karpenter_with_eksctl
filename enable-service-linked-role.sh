# Create the EC2 Spot Service Linked Role, connect it if you use only on-demand instances
aws iam create-service-linked-role --aws-service-name spot.amazonaws.com