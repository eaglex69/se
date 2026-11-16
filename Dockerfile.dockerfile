# Dockerfile
FROM php:8.2-apache

RUN docker-php-ext-install pdo pdo_mysql \
 && a2enmod expires headers deflate rewrite

COPY . /var/www/html/
RUN chown -R www-data:www-data /var/www/html \
 && find /var/www/html -type d -exec chmod 755 {} \; \
 && find /var/www/html -type f -exec chmod 644 {} \; \
 && [ -f /var/www/html/installer.sh ] && chmod +x /var/www/html/installer.sh || true

EXPOSE 80