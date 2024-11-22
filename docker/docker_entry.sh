#!/bin/bash

service ssh restart
mkdir /root/.ssh
cat /root/docker_ssh/*.pub >> /root/.ssh/authorized_keys

exec "$@"