FROM ubuntu:latest
RUN apt update && apt install -y apache2 \
                 ghostscript \
                 libapache2-mod-php \
                 mysql-server \
                 php \
                 php-bcmath \
                 php-curl \
                 php-imagick \
                 php-intl \
                 php-json \
                 php-mbstring \
                 php-mysql \
                 php-xml \
                 php-zip

WORKDIR /var/www/html/
COPY . /var/www/html/
RUN rm -rf index.html
RUN chown www-data:www-data /var/www/html/
RUN a2enmod rewrite

# Specify the command to start Apache
CMD ["apache2ctl", "-D", "FOREGROUND"]

EXPOSE 80
