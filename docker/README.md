```bash
    cd docker
    docker build . -t holidaysm/anygrasp:0.0.0
    docker run -itd -v /home/sm/docker_ssh/:/root/docker_ssh -p 9000:22  holidaysm/anygrasp:0.0.0 /bin/bash
    docker exec -it <container_id> /bin/bash
    ssh root@121.165.144.235 -p 9000 -i ~/.ssh/docker_rsa
```