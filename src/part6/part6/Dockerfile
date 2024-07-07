FROM nginx
WORKDIR /part6
RUN apt update
COPY nginx/nginx.conf ../etc/nginx/nginx.conf
CMD nginx -g 'daemon off;'
