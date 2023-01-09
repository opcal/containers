FROM golang:latest

RUN apt-get update && apt-get -uy upgrade
RUN apt-get -y install git ca-certificates && update-ca-certificates

WORKDIR /build

ARG COREDNS_TAG

RUN git clone -b ${COREDNS_TAG} --single-branch https://github.com/coredns/coredns.git

WORKDIR /build/coredns

ENV CGO_ENABLED=0

RUN sed -i '/^forward:forward.*/i alternate:github.com/coredns/alternate' plugin.cfg

RUN go get github.com/coredns/alternate
RUN go generate coredns.go
RUN go mod tidy -compat=1.17

RUN make

FROM scratch

LABEL org.opencontainers.image.authors="opcal@outlook.com"

WORKDIR /

COPY --from=0 /etc/ssl/certs /etc/ssl/certs
COPY --from=0 /build/coredns/coredns /coredns

ENTRYPOINT ["/coredns"]

