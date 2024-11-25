FROM ubuntu:noble

ENV DEBIAN_FRONTEND=noninteractive

# Install Basic Packages
RUN apt update
RUN apt-get dist-upgrade -y
RUN apt-get install -y lubuntu-desktop xrdp dbus-x11 uuid-runtime xauth xautolock xorgxrdp xprintidle 

RUN cp /etc/X11/xrdp/xorg.conf /etc/X11 && \
  sed -i "s/console/anybody/g" /etc/X11/Xwrapper.config && \
  sed -i "s/xrdp\/xorg/xorg/g" /etc/xrdp/sesman.ini && \
  echo "xfce4-session" >> /etc/skel/.Xclients && \
  cp -r /etc/ssh /ssh_orig && \
  rm -rf /etc/ssh/* && \
  rm -rf /etc/xrdp/rsakeys.ini /etc/xrdp/*.pem; \
  xrdp-keygen xrdp auto 2048;

COPY start.sh /bin/start.sh
RUN chmod +x /bin/start.sh; chmod -R +x /bin/*

# Install Custom software
COPY software /opt/software
RUN chmod -R +x /opt/software/* ;run-parts /opt/software --regex=".sh"

# Copy custon theme
RUN mkdir -p /home/users/
COPY theme /home/users/.config

EXPOSE 3389 
CMD ["bash","/bin/start.sh"]
