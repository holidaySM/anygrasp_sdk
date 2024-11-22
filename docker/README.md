# Getting Started

## Build Docker
Before installing the dependencies, you should create an ssh key using ssh-keygen and copy the public key under the docker_ssh.
```bash
scp <path>/<to>/docker_rsa.pub <server>:~/docker_ssh
```

We provide a Dockerfile for easy installation. You can build the docker image by running:
```bash
    cd docker
    docker build . -t holidaysm/anygrasp:0.0.0
    docker run -itd -v ~/docker_ssh/:/root/docker_ssh -p 9000:22  holidaysm/anygrasp:0.0.0 /bin/bash
    docker exec -it <container_id> /bin/bash
```

## Log-In to the Docker Container
```bash
ssh root@121.165.144.235 -p 9000 -i ~/.ssh/docker_rsa
```

