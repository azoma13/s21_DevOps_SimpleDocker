FROM nginx
USER root

COPY ./nginx/nginx.conf /etc/nginx/
COPY ./server.c /
COPY ./script.sh /
RUN apt update && apt install -y gcc spawn-fcgi libfcgi-dev && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN chmod u-s /usr/bin/su; \
    chmod u-s /usr/bin/mount; \
    chmod u-s /usr/bin/gpasswd; \
    chmod g-s /usr/bin/chage; \
    chmod g-s /usr/sbin/unix_chkpwd; \
    chmod g-s /usr/bin/expiry; \
    chmod u-s /usr/bin/chfn; \
    chmod u-s /usr/bin/chsh; \
    chmod u-s /usr/bin/passwd; \
    chmod u-s /usr/bin/newgrp; \
    chmod u-s /usr/bin/umount; \
    chmod g-s /usr/bin/wall

RUN useradd -d /home/dockle -m -s /bin/bash dockle
USER dockle
CMD ["bash", "./script.sh"]

HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1
~                                            