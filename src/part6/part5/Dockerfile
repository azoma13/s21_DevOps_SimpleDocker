FROM nginx
WORKDIR /part5
RUN apt update && apt install -y nginx gcc spawn-fcgi libfcgi-dev && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY nginx/nginx.conf ../etc/nginx/nginx.conf
COPY server.c .

RUN useradd -d /home/dockle -m -s /bin/bash dockle\
    && chown -R dockle:dockle /etc/nginx/  \
    && chown -R dockle:dockle /part5  \
    && chown -R dockle:dockle /var/log/nginx/ \
    && chown -R dockle:dockle /run/

USER dockle
CMD gcc -o server server.c -lfcgi && spawn-fcgi -p 8080 server && nginx -g 'daemon off;'

HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1
