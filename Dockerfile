ARG IMAGE
FROM ${IMAGE}

# core
RUN apt-get update \
    && apt-get install -y git curl zip unzip libicu-dev \
    && docker-php-ext-install intl

# source folder
ENV SRCDIR=./src WORKDIR=/workdir

# composer
#COPY $SRCDIR/composer.json $WORKDIR/
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && mkdir -p $WORKDIR \
    && cd $WORKDIR \
    && composer install

# copy sources
COPY $SRCDIR/ ./docker-entrypoint.sh $WORKDIR/
RUN chmod +x $WORKDIR/docker-entrypoint.sh

# run
WORKDIR $WORKDIR
ENTRYPOINT ["./docker-entrypoint.sh"]
