#!/bin/bash


FILE=/root/user_setup.done

# Create new user and set root password first boot
if [ ! -f "$FILE" ]; then
    user=user
    passwd=user123
    echo [*] Setting up users ...
    echo "New user: $user"
    echo "New password: $passwd"
    
    mkdir -p /home/$user/
    cp -r /home/users/.config /home/$user/.config
    adduser $user --shell /bin/bash --home /home/$user --disabled-password --gecos GECOS; chown $user -R /home/$user; chgrp $user -R /home/$user
    echo "$user:$passwd"| chpasswd
    echo "$user  ALL=(ALL:ALL) ALL" >> /etc/sudoers
    
    # Make a change root random password
    echo [*] Random Password
    randpass=`echo $RANDOM | md5sum | head -c 20`
    echo "Root Password: $randpass"
    echo "root:$randpass"| chpasswd

    touch $FILE
fi

# Start XRDP
echo [*] Starting XRDP ...
xrdp-sesman
xrdp
echo [*] XRDP started successfully!

# Loop to keep everything alive
while true; do sleep 10000000; done

# -- or run with 12 Hours --
# echo [!] It will Exit in 12 Hours ...
# sleep 43200 
