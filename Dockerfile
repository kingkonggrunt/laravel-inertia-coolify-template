FROM serversideup/php:8.3-fpm-nginx

ENV PHP_OPCACHE_ENABLE=1


USER root

# Install Node.js, libicu-dev(filamentphp) and php extensions
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get update \
    && apt-get install -y nodejs libicu-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install intl

RUN mkdir -p /var/www/html && rm -rf /var/www/html/*
COPY --chown=www-data:www-data . /var/www/html


USER www-data

RUN composer install --no-interaction --optimize-autoloader --no-dev
RUN npm ci \
    && npm run build \
    && rm -rf /var/www/html/.npm \
    && rm -rf /var/www/html/.composer/cache