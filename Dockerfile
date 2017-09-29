FROM unblibraries/nginx-php:alpine-php7
MAINTAINER UNB Libraries Systems <libsystems_at_unb.ca>

LABEL ca.unb.lib.generator="symfony"
LABEL vcs-ref="alpine-nginx-php7-3.3"
LABEL vcs-url="https://github.com/unb-libraries/drupal-symfony"
ARG DRUPAL_COMPOSER_DEV=no-dev

ENV SYMFONY_ROOT_DIR ${APP_ROOT}/html
ENV APP_CACHE_DIR ${SYMFONY_ROOT_DIR}/cache
ENV APP_LOG_DIR ${SYMFONY_ROOT_DIR}/log
ENV APP_WEBROOT ${SYMFONY_ROOT_DIR}/web

COPY ./build/composer.json /app/html/composer.json
COPY ./package-conf /package-conf
COPY ./scripts/container /scripts

# Add symfony, required PHP packages.
RUN apk update && apk --update add rsyslog postfix php7-ldap php7-mbstring php7-ctype php7-tokenizer php7-simplexml php7-dom php7-session php7-session php7-intl php7-pdo && \
  rm -f /var/cache/apk/* && \
  curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony && \
  chmod a+x /usr/local/bin/symfony && \
  rm -rf html && \
  symfony new html && \
  # Package conf files.
  mkdir -p /etc/rsyslog.d && \
  mv /package-conf/nginx/app.conf /etc/nginx/conf.d/app.conf && \
  mv /package-conf/php/app-php.ini /etc/php7/conf.d/zz_app.ini && \
  mv /package-conf/php/app-php-fpm.conf /etc/php7/php-fpm.d/zz_app.conf && \
  rm -rf /package-conf

WORKDIR /app/html
RUN composer install

# Add mutable app files from build.
COPY ./build/src ${SYMFONY_ROOT_DIR}/src
COPY ./build/app ${SYMFONY_ROOT_DIR}/app
