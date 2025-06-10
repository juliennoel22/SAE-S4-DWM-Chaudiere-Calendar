FROM php:8.2-apache

# Active mod_rewrite pour les routes Slim
RUN a2enmod rewrite

# Installe les extensions PHP nécessaires
RUN docker-php-ext-install pdo pdo_mysql

# Copie le code source dans le conteneur
COPY . /var/www/html

# Définit le DocumentRoot dans public/
WORKDIR /var/www/html/calendar.appli/public

# Configure Apache pour rediriger toutes les requêtes vers index.php
RUN sed -i 's|DocumentRoot /var/www/html|DocumentRoot /var/www/html/calendar.appli/public|' /etc/apache2/sites-available/000-default.conf

# Ajoute un .htaccess si nécessaire
COPY ./calendar.appli/public/.htaccess /var/www/html/gift.appli/public/.htaccess
