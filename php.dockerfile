FROM php:8-fpm-alpine

ENV PHPGRROUP=praisex64
ENV PHPUSER=praisex64

RUN adduser -g ${PHPGRROUP} -s /bin/sh -D ${PHPUSER}

RUN sed -i "s/user = www-data/user=${PHPUSER}/g" /usr/local/etc/php-fpm.conf 

RUN sed -i "s/group = www-data/group=${PHPGRROUP}}/g" /usr/local/etc/php-fpm.conf 

RUN mkdir /var/www/html/public



RUN docker-php-ext-install pdo pdo_mysql

CMD ["php-fpm", "-y", "/usr/local/etc/php-fpm.conf", "-R"]