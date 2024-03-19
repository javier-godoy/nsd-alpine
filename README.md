# nsd-alpine
Docker image of NSD based on Alpine Linux


This image builds with `disable-radix-tree` and `enable-packed` in order to minimize the use of memory.

```
  --disable-radix-tree You can disable the radix tree and use the red-black
                          tree for the main lookups, the red-black tree uses
                          less memory, but uses some more CPU.
  --enable-packed Enable packed structure alignment, uses less memory,
                          but unaligned reads.
```

## Build

```
#set ALPINE_TAG and NSD_TAG in Makefile
make
```


## Use 

```
FROM jgodoy/nsd:NSD_4_8_0_REL-alpine-3.19.1 AS nsd
FROM alpine:3.19.1

RUN apk add --no-cache bash shadow libevent && useradd -u 1000 nsd
COPY --from=nsd /compiled /

CMD nsd -d
```
