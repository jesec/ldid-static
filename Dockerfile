# SPDX-License-Identifier: 0BSD or Public Domain
# Copyright (c) 2021, Jesse Chan <jc@linux.com>

FROM alpine

ARG ref=master

RUN apk add --no-cache \
    build-base \
    git \
    libplist-dev \
    libplist-static \
    openssl-dev \
    openssl-libs-static

WORKDIR /root

RUN git clone --depth 1 --branch $ref git://git.saurik.com/ldid.git

WORKDIR /root/ldid

RUN g++ -pipe -o ldid ldid.cpp -I. -x c lookup2.c -lcrypto -lplist-2.0 -Os -fwhole-program -flto -s -static

# binary: /root/ldid/ldid
