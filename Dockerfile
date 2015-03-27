FROM debian

MAINTAINER Govind R


RUN apt-get update \
	&& apt-get upgrade \
	&& apt-get install build-essential \
	&& apt-get install wget  -y --no-install-recommends \
	&& wget http://download.mono-project.com/sources/mono/mono-3.12.0.tar.bz2 \
	&& tar -xvf mono-3.12.0.tar.bz2
	&& cd mono-3.12.0
	&& ./configure --prefix=/usr/local
	&& make
	&& make install
	&& mono --version
	&& apt-get purge wget -y \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /var/tmp/*
    && mono --version
