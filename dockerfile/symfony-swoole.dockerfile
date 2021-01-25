FROM debian:latest

ARG PROJECTNAME=my_app

WORKDIR /server

RUN apt update && apt -y upgrade
RUN apt -y install unzip wget git lsb-release apt-transport-https ca-certificates

# TO CHANGE | it's unnecessary
RUN git config --global user.email "your@email.com"
RUN git config --global user.name "yourUsername"

RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
RUN apt update && apt -y upgrade

RUN apt -y install php7.4 php7.4-zip php7.4-xml php7.4-dev php7.4-curl php7.4-pgsql php-pear
RUN pecl install swoole
RUN echo "extension=swoole.so" >> /etc/php/7.4/cli/php.ini

RUN wget https://get.symfony.com/cli/installer -O - | bash
RUN mv /root/.symfony/bin/symfony /usr/local/bin/symfony

RUN symfony new --full ${PROJECTNAME}

WORKDIR ${PROJECTNAME}

RUN symfony composer require k911/swoole-bundle
RUN symfony composer dump-autoload
RUN echo symfony composer update | tee ~/.bashrc

RUN echo php bin/console swoole:server:run | tee -a ~/.bashrc
