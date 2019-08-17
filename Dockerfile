FROM alpine:3.4

RUN apk update
RUN apk add -q --no-cache openssl python binutils cmake make libgcc gcc g++
RUN apk add -q --no-cache freetype-dev icu-dev harfbuzz-dev boost-dev libjpeg libpng libcurl libpg

RUN wget -O /tmp/mapnik.tar.bz2 https://github.com/mapnik/mapnik/releases/download/v3.0.22/mapnik-v3.0.22.tar.bz2
RUN bzip2 -d /tmp/mapnik.tar.bz2
WORKDIR /src
RUN tar xf /tmp/mapnik.tar

WORKDIR /src/mapnik-v3.0.22

RUN mkdir -p /tmp/icu_data
ENV ICU_DATA=/tmp/icu_data

RUN sh configure
RUN make install

CMD /bin/sh
