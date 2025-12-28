# Rocky Linux - Docker config
#### This is my configuration for running rocky linux with terminal on my Mac OS.

### build the image
```docker build --platform linux/amd64 -t rocky-vm .```

### run
```docker run -it --platform linux/amd64 -v /Users/pramitgaha/programs:/data/programs --name rocky-vm rocky-vm /bin/bash```

### run the container again
```
docker start rocky-vm
docker exec -it rocky-vm /bin/bash
```

### deleting container
```docker rm rocky-vm```
