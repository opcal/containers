FROM --platform=${TARGETPLATFORM} ghcr.io/opcal/alpine:latest AS builder

WORKDIR /app

RUN RUN set -eux; \
    apk add --no-cache build-base git ; \
    git clone https://github.com/skeeto/endlessh.git . ; \
    make

FROM --platform=${TARGETPLATFORM} ghcr.io/opcal/alpine:latest

WORKDIR /app

RUN adduser -d /app -u 1001 -g '' -D endlessh

COPY --from=builder --chown=${1001} /app/endlessh /app/
COPY --chown=${1001} ${PROJECT_DIR}/endlessh/config /app/

EXPOSE 2222/tcp
USER 1001

ENTRYPOINT ["/app/endlessh"]

CMD ["-f", "/app/config", "-v"]