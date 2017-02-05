#!/bin/bash

# Uninstall Script

if [ "${USER}" != "root" ]; then
    echo "$0 must be run as root!"
    exit 2
fi

while true; do
  read -p "Remove all Docker Machine VMs? (Y/N): " yn
  case $yn in
    [Yy]* ) docker-machine rm -f $(docker-machine ls -q); break;;
    [Nn]* ) break;;
    * ) echo "Please answer yes or no."; exit 1;;
  esac
done

echo "Removing Applications..."
rm -rf /Applications/Docker

echo "Removing docker binaries..."
rm -f /usr/local/bin/docker
rm -f /usr/local/bin/docker-machine
rm -r /usr/local/bin/docker-machine-driver*
rm -f /usr/local/bin/docker-compose

echo "Removing boot2docker.iso"
rm -rf /usr/local/share/boot2docker

echo "Forget packages"
pkgutil --forget io.docker.pkg.docker
pkgutil --forget io.docker.pkg.dockercompose
pkgutil --forget io.docker.pkg.dockermachine
pkgutil --forget io.boot2dockeriso.pkg.boot2dockeriso


#!/bin/bash

# Uninstall Script

if [ "$(which boot2docker)" == "" ]; then
	echo "boot2docker does not exist on your machine!"
	exit 1
fi

if [ "${USER}" != "root" ]; then
	echo "$0 must be run as root!"
	exit 2
fi

echo "Stopping boot2docker processes..."
boot2docker stop && boot2docker delete

echo "Removing boot2docker executable..."
rm -f /usr/local/bin/boot2docker

echo "Removing boot2docker ISO and socket files..."
rm -rf ~/.boot2docker
rm -rf /usr/local/share/boot2docker

echo "Removing boot2docker SSH keys..."
rm -f ~/.ssh/id_boot2docker*

echo "Removing boot2docker OSX files..."
rm -f /private/var/db/receipts/io.boot2docker.*
rm -f /private/var/db/receipts/io.boot2dockeriso.*

echo "Removing Docker executable..."
rm -f /usr/local/bin/docker

echo "All Done!"
