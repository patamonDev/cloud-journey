#!/bin/bash

# De-provision any resources created by TF
tofu destroy -auto-approve

# Remove the tfstate file and the .hcl file
rm -rf .terraform && rm -f .terraform.lock.hcl

# Delete the bootstrapped resources
RG_NAME="dev-rg-9254"

echo "Deleting the RG: $RG_NAME"
az group delete --name "$RG_NAME" --yes --no-wait
