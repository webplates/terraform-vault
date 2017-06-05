#!/usr/bin/env bash

set -e

echo "Starting up Vault..."

sudo mkdir -p /etc/systemd/system/vault.d
sudo chown root:root /tmp/vault.service
sudo mv /tmp/vault.service /etc/systemd/system/vault.service
sudo chmod 0644 /etc/systemd/system/vault.service

sudo systemctl start vault
