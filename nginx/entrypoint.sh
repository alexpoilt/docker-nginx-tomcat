#! /bin/bash

sed -i -e "s/\[FQDN\]/$FQDN/g" \
-e "s/\[HTTP_PORT\]/$HTTP_PORT/g" \
-e "s/\[APP_PATH\]/$APP_PATH/g" \
/etc/nginx/sites-available/999-vhost.conf

ln -s /etc/nginx/sites-available/999-vhost.conf /etc/nginx/sites-enabled/999-vhost.conf

rm -fr /etc/nginx/sites-enabled/default

rm -fr /etc/nginx/sites-available/default

/usr/sbin/nginx -g "daemon off;"
