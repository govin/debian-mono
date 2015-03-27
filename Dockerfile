FROM debian

MAINTAINER Govind R


RUN apt-get -y update \
	&& apt-get -y upgrade \
	&& apt-get install build-essential -y --no-install-recommends \
	&& apt-get install wget  -y --no-install-recommends \
	&& wget http://download.mono-project.com/sources/mono/mono-3.12.0.tar.bz2 \
	&& tar -xvf mono-3.12.0.tar.bz2
	&& cd mono-3.12.0
	&& ./configure --prefix=/usr/local
	&& make
	&& make install
	&& mono --version
	&& apt-get install mono-devel -y \
	&& apt-get install nuget -y \
	&& apt-get install nunit -y \
	&& apt-get purge wget -y \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /var/tmp/*
    && mono --version
    && mozroots --import --ask-remove \
