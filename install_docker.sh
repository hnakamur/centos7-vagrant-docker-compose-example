#!/bin/sh
set -e

sudo yum install -y git xz

if [ ! -f /usr/bin/docker ]; then
  sudo curl -L -o /usr/bin/docker https://get.docker.com/builds/Linux/x86_64/docker-latest
  sudo chmod +x /usr/bin/docker
fi

if [ ! -f /usr/lib/systemd/system/docker.service ]; then
  sudo curl -L -o /usr/lib/systemd/system/docker.service https://raw.githubusercontent.com/docker/docker/master/contrib/init/systemd/docker.service
  sudo curl -L -o /usr/lib/systemd/system/docker.socket https://raw.githubusercontent.com/docker/docker/master/contrib/init/systemd/docker.socket

  sudo groupadd --system docker
  sudo systemctl enable docker  
  sudo systemctl start docker
fi

if [ ! -f /usr/bin/docker-compose ]; then
  curl -L -o /usr/bin/docker-compose https://github.com/docker/compose/releases/download/1.2.0/docker-compose-`uname -s`-`uname -m`
  chmod +x /usr/bin/docker-compose
fi
