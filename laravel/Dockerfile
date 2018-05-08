FROM risul/php-fpm:latest

# Set APP_NAME ENV
ENV APP_NAME myapp

# Install laravel and add it to path
RUN composer global require "laravel/installer"
RUN echo "PATH=$PATH:~/.composer/vendor/bin" >> ~/.bashrc

# Create a new laravel app in home folder
WORKDIR /var
RUN composer create-project laravel/laravel myapp

# Copy entrypoint script
ADD ./init.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Set /var/www as workdir
WORKDIR /var/www 

# Set entrypoint
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]