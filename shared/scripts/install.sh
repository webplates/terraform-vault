#!/usr/bin/env bash

set -e

VAULT_VERSION=$(cat /tmp/vault-version | tr -d '\n')

if [ -z "${VAULT_VERSION}" ]; then
    echo "VAULT_VERSION variable must be provided"
    exit 1
fi

echo "Fetching Vault..."
cd /tmp
wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip -O vault.zip --quiet

echo "Installing Vault..."
unzip vault.zip > /dev/null
chmod +x vault
sudo mv vault /usr/local/bin/vault
rm vault.zip

sudo mkdir -p /etc/vault
sudo mv /tmp/vault.hcl /etc/vault/vault.hcl
