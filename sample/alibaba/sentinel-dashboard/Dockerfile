FROM registry.gitlab.com/opcal-project/containers/eclipse-temurin:11-jre

LABEL Author="OPCAL"

WORKDIR /app

RUN set -eux; \
    groupadd -r opcal --gid=1000; \
    useradd -r -g opcal --uid=1000 -m -d /app opcal; \
    chown -R  opcal:opcal "/app"; \
    mkdir -p /data; \
    chown -R  opcal:opcal "/data"; \
    gosu nobody true

ARG SENTINEL_VERSION

RUN curl https://github.com/alibaba/Sentinel/releases/download/${SENTINEL_VERSION}/sentinel-dashboard-${SENTINEL_VERSION}.jar -L -o sentinel-dashboard.jar

COPY ${CI_PROJECT_DIR}/sample/alibaba/sentinel-dashboard/docker-entrypoint.sh /

EXPOSE 8080

ENTRYPOINT ["/docker-entrypoint.sh"]