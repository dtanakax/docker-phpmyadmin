#!/bin/sh
set -e

PMA_CONFIG=/var/www/html/config.inc.php

if [ ! -f $PMA_CONFIG ]; then
    echo "=> Installing phpMyAdmin ..."

    mv -f /config.inc.php $PMA_CONFIG

    sed -i "s/PMA_SECRET/$PMA_SECRET/
            s/PMA_USERNAME/$PMA_USERNAME/
            s/PMA_PASSWORD/$PMA_PASSWORD/
            s/DB_HOST/$DB_HOST/
            s/DB_PORT/$DB_PORT/g" $PMA_CONFIG
    echo "=> Done"
else
    echo "=> Using an existing phpMyAdmin"
fi
