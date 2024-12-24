#!/bin/bash

set -e  

echo "Updating system and installing required tools..."
apt update -y && apt install -y wget curl

echo "Creating directory for Harbor and downloading..."
mkdir -p /tools/harbor && cd /tools/harbor


curl -s https://api.github.com/repos/goharbor/harbor/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep '.tgz$' | wget -i -


if ls harbor-offline-installer*.tgz 1>/dev/null 2>&1; then
    echo "Extracting Harbor installer..."
    tar xvzf harbor-offline-installer*.tgz
else
    echo "Failed to download Harbor package. Exiting."
    exit 1
fi


cd harbor/
cp harbor.yml.tmpl harbor.yml

echo "Configuring Harbor for HTTP and IP..."


sed -i 's#https://#http://#g' harbor.yml


IP_ADDRESS="192.168.133.155" 
sed -i "s/hostname: .*/hostname: ${IP_ADDRESS}/g" harbor.yml

echo "Harbor has been configured for HTTP and IP."
