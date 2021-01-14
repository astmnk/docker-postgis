FROM postgres:10.15

ENV POSTGIS_VERSION 2.4.9

RUN buildDeps=" \
  postgresql-server-dev-${PG_MAJOR} \
  libgeos-dev \
  libproj-dev \ 
  libgdal-dev \
  libjson-c3 \
  make \
  curl \
  gcc \
  "; \
     apt-get update \
  && apt-get install -y lsb-release && lsb_release -a \
  && apt-get install -y $buildDeps libxml2 --no-install-recommends \
  && curl -o /tmp/postgis-$POSTGIS_VERSION.tar.gz -s \ 
      http://download.osgeo.org/postgis/source/postgis-$POSTGIS_VERSION.tar.gz \
  && tar xf /tmp/postgis-$POSTGIS_VERSION.tar.gz -C /usr/src/ \
  && cd /usr/src/postgis-$POSTGIS_VERSION \
  && ./configure \
  && make -j"$(nproc)" \
  && make install \
  && cd extensions \
  && make -j"$(nproc)" \
  && make install \
  && cd / && rm /tmp/postgis-$POSTGIS_VERSION.tar.gz \
  && apt-get purge --auto-remove -y $buildDeps \
  && rm -rf /var/lib/apt/lists/*

RUN postgisDeps=' \
  libgdal20 \
  libproj12 \
  libgeos-3.5.1 \
  libjson-c3 \ 
  '; \
    apt-get update \
  && apt-get install -y $postgisDeps \
  && rm -rf /var/lib/apt/lists/*

COPY initdb-postgis.sh /docker-entrypoint-initdb.d/postgis.sh
