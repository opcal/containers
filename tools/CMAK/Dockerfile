FROM ghcr.io/opcal/eclipse-temurin:11-jre AS build

ARG CMAK_VERSION

RUN apt update && apt install unzip -y \
    && curl -L https://github.com/yahoo/CMAK/releases/download/${CMAK_VERSION}/cmak-${CMAK_VERSION}.zip -o /tmp/cmak.zip \
    && unzip /tmp/cmak.zip -d / \
    && ln -s /cmak-$CMAK_VERSION /cmak \
    && rm -rf /tmp/cmak.zip

FROM ghcr.io/opcal/eclipse-temurin:11-jre

LABEL org.opencontainers.image.authors="opcal@outlook.com"

COPY --from=build /cmak /cmak

WORKDIR /cmak

ENTRYPOINT ["/cmak/bin/cmak", "-Dpidfile.path=/dev/null", "-Dapplication.home=/cmak", ""]