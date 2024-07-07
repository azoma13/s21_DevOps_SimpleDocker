#!/bin/bash

#apt update
#apt upgrade
#apt install -y gcc spawn-fcgi libfcgi-dev
gcc -o server ./server.c -lfcgi
spawn-fcgi -p 8080 ./server
nginx -g 'daemon off;'
