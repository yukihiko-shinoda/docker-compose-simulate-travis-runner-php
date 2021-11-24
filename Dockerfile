FROM ubuntu:bionic-20210930
RUN apt-get update
RUN apt-get install -y \
# To download phpenv-installer, composer installer
# phpenv-composer depends curl
    curl \
# To install phpenv, phpcs
    git \
# To compile php when install it
# @see https://7me.nobiki.com/2021/04/20/phpenv-build-error-memo/
    libxml2 \
    libxml2-dev \
    libssl-dev \
    pkg-config \
    libbz2-dev \
    libcurl4-openssl-dev \
    libjpeg-dev \
    libpng-dev \
    libreadline-dev \
    libtidy-dev \
    libxslt-dev \
    libzip-dev \
    autoconf \
    build-essential
RUN curl https://raw.githubusercontent.com/phpenv/phpenv-installer/master/bin/phpenv-installer --output phpenv-installer.sh
RUN bash phpenv-installer.sh
# To apply path that phpenv-installer.sh applyed
ENV PATH="${PATH}:/usr/local/bin"
ENV PATH="/root/.phpenv/bin:${PATH}"
RUN eval "$(phpenv init -)"
# To apply path that eval "$(phpenv init -)" applyed
ENV PATH="/root/.phpenv/shims:${PATH}"
RUN phpenv install 7.3.32
RUN phpenv rehash
RUN phpenv global 7.3.32
