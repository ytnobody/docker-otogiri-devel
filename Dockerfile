FROM alpine:3.6
MAINTAINER ytnobody<ytnobody@gmail.com>

WORKDIR /root

RUN apk --no-cache add openssh bash libc-dev git curl wget patch make gcc mariadb-dev postgresql-dev postgresql vim openssl
ENV SHELL=/bin/bash

RUN curl -sL https://is.gd/plenvsetup | bash
RUN .plenv/bin/plenv install 5.30.0
RUN .plenv/bin/plenv global 5.30.0
RUN .plenv/bin/plenv install-cpanm
RUN .plenv/bin/plenv rehash

RUN .plenv/shims/cpanm -n Minilla Pod::Perldoc::ToText Version::Next CPAN::Uploader
RUN .plenv/bin/plenv rehash

COPY script script

CMD bash script/build.sh