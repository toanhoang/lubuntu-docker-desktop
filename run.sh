#!/bin/sh

docker run -p 3389:3389 -it --cap-add=SYS_ADMIN --shm-size 1g --device /dev/fuse:/dev/fuse lubuntu-desktop /bin/RunOnce.sh user user123
#docker run -p 3389:3389 -it --cap-add=SYS_ADMIN --shm-size 1g --device /dev/fuse:/dev/fuse --rm lubuntu-desktop /bin/RunOnce.sh user user123
