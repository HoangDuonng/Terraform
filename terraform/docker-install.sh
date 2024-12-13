#!/bin/bash
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce
sudo systemctl start docker
sudo systemctl enable docker
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker --version
docker-compose --version



# harbor-install.sh
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




# jenkins-install.sh
apt install openjdk-17-jdk -y
java --version
wget -p -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add -
sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5BA31D57EF5975CA
apt-get update
apt install jenkins -y
systemctl start jenkins
systemctl enable jenkins
ufw allow 8080