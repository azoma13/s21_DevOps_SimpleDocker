FROM nginx
USER root

COPY ./nginx/nginx.conf /etc/nginx/
COPY ./server.c /
COPY ./script.sh /
RUN apt update
RUN apt install -y gcc spawn-fcgi libfcgi-dev
CMD ["bash", "./script.sh"]