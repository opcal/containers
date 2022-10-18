FROM registry.gitlab.com/opcal-project/containers/eclipse-temurin:11-jre-alpine as build

ARG CMAK_VERSION

RUN apk --no-cache add unzip \
    && curl -L https://github.com/yahoo/CMAK/releases/download/${CMAK_VERSION}/cmak-${CMAK_VERSION}.zip -o /tmp/cmak.zip \
    && unzip /tmp/cmak.zip -d / \
    && ln -s /cmak-$CMAK_VERSION /cmak \
    && rm -rf /tmp/cmak.zip

FROM registry.gitlab.com/opcal-project/containers/eclipse-temurin:11-jre-alpine

LABEL Author="OPCAL"

COPY --from=build /cmak /cmak

RUN apk --no-cache add bash

WORKDIR /cmak

ENTRYPOINT ["/cmak/bin/cmak", "-Dpidfile.path=/dev/null", "-Dapplication.home=/cmak", ""]