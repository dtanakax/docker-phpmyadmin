# Set the base image
FROM tanaka0323/storage

# File Author / Maintainer
MAINTAINER Daisuke Tanaka, tanaka@infocorpus.com

# Environment variables
ENV PMA_SECRET          blowfish_secret
ENV PMA_USERNAME        pma
ENV PMA_PASSWORD        password
ENV DB_HOST             localhost
ENV DB_PORT             3306
ENV VERSION             4.3.12

# Install packages
RUN opkg-install wget tar

# Create directories
RUN mkdir -p /var/www/
RUN chmod -R 755 /var/www/

ADD entrypoint.sh /entrypoint.sh
ADD config.inc.php /config.inc.php
RUN chown root:root /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Setup phpMyAdmin
ADD http://downloads.sourceforge.net/project/phpmyadmin/phpMyAdmin/${VERSION}/phpMyAdmin-${VERSION}-all-languages.tar.gz /phpmyadmin.tar.gz
RUN tar zxvf /phpmyadmin.tar.gz
RUN rm -f /phpmyadmin.tar.gz
RUN mv /phpMyAdmin-${VERSION}-all-languages /var/www/html
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

# Define mountable directories.
VOLUME ["/var/www/html"]

ENTRYPOINT ["/entrypoint.sh"]