# Lubuntu-Docker-Desktop
Run Lubuntu Desktop in Docker container.  RDP only.

![image](img/1.png)

![image](img/2.png)


## Feature
+ Base on Ubuntu LTS 24.04 (Noble Numbat).
+ LXQT Desktop Environment.
+ Easy to modify source code.
+ RDP Only.
+ Possible to install Firefox, Chrome, etc... (rename .disabled to .sh to enable in /software/).
+ RDP Copy and paste working.

## Quick Run

``` bash
docker run -p 3389:3389 -it --cap-add=SYS_ADMIN --shm-size 1g --device /dev/fuse:/dev/fuse --rm manesec/lubuntu-desktop /bin/RunOnce.sh user user123
```

Once the boot is complete, you can use RDP to connect.

Note that: 
+ `--rm run once` 
+ `--cap-add=SYS_ADMIN` and `--shm-size 1g` : used for google-chrome and firefox.
+ `--device /dev/fuse:/dev/fuse` To fix appImage like app error.
+ `user` is login username, you can feel free to change.
+ `user123` is login password, you can feel free to change.

X64 working good, I have not test for arm and X86.

## How to Build ?

``` bash
git clone https://github.com/manesec/Lubuntu-Docker-Desktop.git Lubuntu-Docker-Desktop
cd Lubuntu-Docker-Desktop
docker build -t lubuntu-desktop .
docker run -p 3389:3389 -it --cap-add=SYS_ADMIN --shm-size 1g  --device /dev/fuse:/dev/fuse --rm lubuntu-desktop /bin/RunOnce.sh mane maneisagoodman
```


## Folder information

When you build a docker image, using `docker build -t lubuntu-desktop .`, it will install some software in `software` folder.

To disable it, just change name without `.sh`, For example:

+ I am not going to install google-chrome: Goto `software`, change `chrome.sh` to `chrome.disabled`.


# FAQ

## FAQ: What is the root Password ?

The root password is random, you can check when you start the container.

```bash
root@manepc:/home/mane/Lubuntu-Docker-Desktop# docker run -p 3389:3389 -it --cap-add=SYS_ADMIN --device /dev/fuse:/dev/fuse --shm-size 1g --rm lubuntu-desktop /bin/RunOnce.sh mane maneisagoodman
...
[*] Random Password
Root Password: 8bfb45234ecf8d11b346
...
```

I am very recommend to use `sudo -s` to get root user.

# License 
GNU General Public License v3.0
