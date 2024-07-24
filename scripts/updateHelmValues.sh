#!/bin/bash

set -x

# Set the repository URL
REPO_URL="https://quo4awct2nr5ar75g4y2liqtdf4y4jst4n3izgjt6pkjbgsgtora@dev.azure.com/vigneshn2707/odoo_deployment/_git/odoo_deployment"

# Clone the git repository into the /tmp directory
git clone "$REPO_URL" /tmp/temp_repo

# Navigate into the cloned repository directory
cd /tmp/temp_repo

# Make changes to the Kubernetes manifest file(s)
# For example, let's say you want to change the image tag in a values.yaml file
tag=$1
sed -i "s|\(tag:\s*\).*|\1\"${tag}\"|" odoo-helm/values.yaml

# Add the modified files
git add .

# Commit the changes
git commit -m "Update Kubernetes manifest"

# Push the changes back to the repository
git push

# Cleanup: remove the temporary directory
rm -rf /tmp/temp_repo

