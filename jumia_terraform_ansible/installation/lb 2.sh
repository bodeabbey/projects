#! /bin/bash
# Instance Identity Metadata Reference - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-identity-documents.html
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install vim -y
sudo apt-get install ufw -y
sudo ufw default deny incoming
sudo ufw allow 80
sudo ufw allow 443
sudo ufw allow 1337/tcp
sudo ufw allow 22
sudo ufw --force enable