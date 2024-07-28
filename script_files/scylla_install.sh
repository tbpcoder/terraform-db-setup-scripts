#!/bin/bash

sudo mkdir -p /etc/apt/keyrings
sudo gpg --homedir /tmp --no-default-keyring --keyring /etc/apt/keyrings/scylladb.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys d0a112e067426ab2
sudo wget -O /etc/apt/sources.list.d/scylla.list http://downloads.scylladb.com/deb/debian/scylla-5.4.list
sudo apt-get update
sudo apt-get install -y scylla
sudo apt-get update
sudo apt-cache search openjdk-21
sudo apt-get install -y openjdk-21-jre-headless

# Configure the following parameters in the /etc/scylla/scylla.yaml configuration file.
# cluster_name, seeds, listen_address, rpc_address

# sudo scylla_setup
# The script invokes a set of scripts to configure several operating system settings; for example, it sets RAID0 and XFS filesystem.

# sudo systemctl start scylla-server

# cqlsh
# port: 9042