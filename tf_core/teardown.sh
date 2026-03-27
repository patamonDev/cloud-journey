#!/bin/bash

# De-provision any resources created by TF
# terraform destroy -auto-approve

# # Remove the tfstate file and the .hcl file
# rm -rf .terraform && rm -f .terraform.lock.hcl

# Delete the bootstrapped resources
RG_NAME="TF-Core-RG"

echo "Deleting the RG: $RG_NAME"
az group delete --name "$RG_NAME" --yes --no-wait
