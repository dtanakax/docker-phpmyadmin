# Set the base image
FROM dtanakax/storage

# File Author / Maintainer
MAINTAINER Daisuke Tanaka, dtanakax@gmail.com

# Environment variables
ENV PMA_SECRET          blowfish_secret
ENV PMA_USERNAME        pma
ENV PMA_PASSWORD        password
ENV DB_HOST             localhost
ENV DB_PORT             3306
ENV VERSION             4.4.13

# Create directories
RUN mkdir -p /var/www/
COPY entrypoint.sh /entrypoint.sh
COPY config.inc.php /config.inc.php
RUN chown root:root /entrypoint.sh && \
    chmod +x /entrypoint.sh

# Setup phpMyAdmin
ADD https://files.phpmyadmin.net/phpMyAdmin/${VERSION}/phpMyAdmin-${VERSION}-all-languages.zip /phpmyadmin.zip
RUN unzip /phpmyadmin.zip && \
    rm -f /phpmyadmin.zip && \
    mv /phpMyAdmin-${VERSION}-all-languages /var/www/html && \
    chmod -R 755 /var/www/html

ENTRYPOINT ["./entrypoint.sh"]

# Define mountable directories.
VOLUME ["/var/www/html"]

CMD ["/bin/sh"]