FROM --platform=${TARGETPLATFORM} golang:latest AS build

RUN apt-get update; \
    apt-get -uy upgrade; \
    apt-get -y install git ca-certificates libcap2-bin ; \
    update-ca-certificates

WORKDIR /build

ARG COREDNS_TAG

RUN git clone -b ${COREDNS_TAG} --single-branch https://github.com/coredns/coredns.git

WORKDIR /build/coredns

ENV CGO_ENABLED=0

RUN sed -i '/^forward:forward.*/i alternate:github.com/coredns/alternate' plugin.cfg ; \
    go get github.com/coredns/alternate ; \
    go generate coredns.go ; \
    go mod tidy -compat=1.17 ; \
    make ; \
    setcap cap_net_bind_service=+ep /build/coredns/coredns

FROM --platform=${TARGETPLATFORM} scratch
# FROM --platform=${TARGETPLATFORM} gcr.io/distroless/static-debian11:nonroot

LABEL org.opencontainers.image.authors="opcal@outlook.com"

WORKDIR /

COPY --from=build /etc/ssl/certs /etc/ssl/certs
COPY --from=build /build/coredns/coredns /coredns

# USER nonroot:nonroot
ENTRYPOINT ["/coredns"]

