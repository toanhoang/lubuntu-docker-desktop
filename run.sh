#!/bin/sh

# Run desktop once and delete afterwards
docker run --rm -p 3389:3389 -it --cap-add=SYS_ADMIN --shm-size 1g --device /dev/fuse:/dev/fuse lubuntu-desktop-once 
