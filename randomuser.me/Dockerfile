FROM --platform=${TARGETPLATFORM} ghcr.io/opcal/alpine:latest AS builder

ARG RUSERME_VERSION

WORKDIR /app

RUN set -eux; \
	apk --no-cache add dpkg curl tar unzip; \
    curl -L https://github.com/RandomAPI/Randomuser.me-Node/archive/refs/tags/${RUSERME_VERSION}.tar.gz -o /tmp/source.tar.gz ; \
    tar -xzf /tmp/source.tar.gz  ; \
    cp -r Randomuser.me-Node-$(echo ${RUSERME_VERSION} | cut -d 'v' -f 2)/* /app ;

COPY randomuser.me/models/db.js /app/models/
COPY randomuser.me/settings.json /app/


FROM node:9-slim

WORKDIR /app

COPY --from=builder /app /app

RUN npm install

CMD npm start
