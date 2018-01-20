ARG IMAGE
FROM ${IMAGE}

# packages
ARG PACKAGES
RUN if [ "${PACKAGES}" ]; then apt-get update && apt-get install -y ${PACKAGES}; fi

# php modules
ARG PHPMODS
RUN if [ "${PHPMODS}" ]; then docker-php-ext-install ${PHPMODS}; fi

# source folder
ENV SRCDIR=./sources WORKDIR=/workdir

# composer
COPY ${SRCDIR}/composer.json ${WORKDIR}/
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && mkdir -p ${WORKDIR} \
    && cd ${WORKDIR} \
    && composer install

# copy sources
COPY ${SRCDIR}/ ./docker-entrypoint.sh ${WORKDIR}/
RUN chmod +x ${WORKDIR}/docker-entrypoint.sh

# run
WORKDIR ${WORKDIR}
ENTRYPOINT ["./docker-entrypoint.sh"]