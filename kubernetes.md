# Install kubernetes
curl -fsSf get.docker.com | bash

# Confirm instalation
docker --version

# Add kubernets repository
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main"  > /etc/apt/sources.list.d/k8s.list

# Add key do kubernetes
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

# Get list of packages
apt-get update

# Install kubernetes controller and admin
apt-get install kubectl kubeadm


