#!/bin/bash

service ssh restart
mkdir /root/.ssh
cat /root/docker_ssh/*.pub >> /root/.ssh/authorized_keys

echo 'export PATH=/opt/conda/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

exec "$@"