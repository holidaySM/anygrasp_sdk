```bash
    cd docker
    docker build . -t holidaysm/anygrasp:0.0.0
    docker run -itd --gpus all holidaysm/anygrasp:0.0.0 /bin/bash
    docker exec -it <container_id> /bin/bash
```