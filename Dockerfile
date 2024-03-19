ARG ALPINE_TAG
FROM alpine:${ALPINE_TAG}

ARG NSD_TAG

#git and OpenSSH
RUN apk --no-cache add git openssh

#Shared C build chain
RUN apk --no-cache add autoconf make automake gcc libc-dev

RUN apk --no-cache add openssl-dev libevent-dev flex bison

RUN git clone --progress --verbose --single-branch --branch ${NSD_TAG} https://github.com/NLnetLabs/nsd

RUN cd nsd &&\
    autoreconf -fi &&\
    ./configure --disable-radix-tree --enable-packed --disable-ipv6 &&\
    make --jobs=8 &&\
    make install &&\
	mkdir -p /compiled/usr/local/sbin &&\
    cp -r /usr/local/sbin/nsd* /compiled/usr/local/sbin

CMD echo

