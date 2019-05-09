#!/bin/bash

sudo su

export PUBLIC_IPV4=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)

echo "deb https://repo.gluu.org/ubuntu/ bionic main" > /etc/apt/sources.list.d/gluu-repo.list
curl https://repo.gluu.org/ubuntu/gluu-apt.key | apt-key add -
apt-get update
apt-get upgrade -y
apt-get install -y apt-get install gluu-server-3.1.6
