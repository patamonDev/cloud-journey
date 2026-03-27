#!/bin/bash

# Intialize and declare the variables
RG_NAME="TF-Core-RG"
SA_NAME="tfcorestorage"
SA_CONTAINER_NAME="tfstate"

# Creates the RG for my project
az group create --name $RG_NAME --location eastus2 --tags Environment=dev

# Creates the SA for my project
az storage account create \
    --name $SA_NAME \
    --resource-group $RG_NAME \
    --sku Standard_LRS \
    --tags Environment=dev

# Creates the SA Container for my tfstate
az storage container create \
    --name $SA_CONTAINER_NAME \
    --account-name $SA_NAME

# terraform init \
#     -backend-config="resource_group_name=$RG_NAME" \
#     -backend-config="storage_account_name=$SA_NAME" \
#     -backend-config="container_name=$SA_CONTAINER_NAME" \
#     -backend-config="key=terraform.tfstate"