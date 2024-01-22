# Use the official WordPress image based on Ubuntu
FROM wordpress:latest

# Set the MySQL root password
ENV MYSQL_ROOT_PASSWORD=<your-database-password>

# Create a custom database for WordPress
ENV MYSQL_DATABASE=wordpress
ENV MYSQL_USER=wordpress
ENV MYSQL_PASSWORD=<your-wordpress-password>

# Copy custom PHP configuration file to set recommended PHP settings
COPY php.ini /usr/local/etc/php/conf.d/

# Expose ports
EXPOSE 80

# Copy custom configuration for Apache
COPY apache-config.conf /etc/apache2/sites-available/000-default.conf

# Enable mod_rewrite for WordPress permalinks
RUN a2enmod rewrite

# Set working directory to WordPress installation
WORKDIR /var/www/html

# Copy custom theme or plugins if needed
# COPY themes/* wp-content/themes/
# COPY plugins/* wp-content/plugins/
