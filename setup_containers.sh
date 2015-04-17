#!/bin/sh
set -e

if [ ! -f /etc/systemd/system/docker-compose.service ]; then
  cat <<'EOF' | sudo sh -c 'cat > /etc/systemd/system/docker-compose.service'
[Unit]
Description=Docker Compose runs multiple docker containers
Documentation=https://docs.docker.com/compose/
Requires=docker.service

[Service]
ExecStart=/usr/bin/docker-compose up
ExecStop=/usr/bin/docker-compose down
WorkingDirectory=/vagrant/containers

[Install]
WantedBy=multi-user.target
EOF
  systemctl daemon-reload
  systemctl enable daemon-reload
  systemctl start daemon-reload
fi
