#!/bin/sh

/usr/sbin/crond -f -l 8 &

nginx -g 'daemon off;'