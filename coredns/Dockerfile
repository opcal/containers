FROM golang:latest AS build

WORKDIR /build/coredns

ENV CGO_ENABLED=0
ARG COREDNS_TAG

RUN set -eux; \
    apt-get update; \
    apt-get -uy upgrade; \
    apt-get -y install \
        ca-certificates \
        git \
        libcap2-bin ; \
    update-ca-certificates; \
    git clone -b ${COREDNS_TAG} --single-branch https://github.com/coredns/coredns.git . ; \
    sed -i '/^forward:forward.*/i alternate:github.com/coredns/alternate' plugin.cfg ; \
    go get github.com/coredns/alternate ; \
    go generate coredns.go ; \
    make ; \
    setcap cap_net_bind_service=+ep /build/coredns/coredns

# go mod tidy -compat=1.17 ; \

FROM ghcr.io/opcal/ubuntu:noble

LABEL org.opencontainers.image.authors="opcal@outlook.com"

WORKDIR /

COPY --from=build /etc/ssl/certs /etc/ssl/certs
COPY --from=build /build/coredns/coredns /coredns

# USER nonroot:nonroot
ENTRYPOINT ["/coredns"]

