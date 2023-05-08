ARG BASE_IMAGE

FROM --platform=${TARGETPLATFORM} ${BASE_IMAGE}

LABEL org.opencontainers.image.authors="opcal@outlook.com"

RUN set -eux; \
    DEBIAN_FRONTEND=noninteractive \
    apt-get update \
    && apt-get install -y openssh-server \
    && apt-get clean \
    && apt-get -y autoclean \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /var/run/sshd \
    && sed -ri 's/#Port\s+.*/Port 2222/g' /etc/ssh/sshd_config \
    && sed -ri 's/#PasswordAuthentication\s+.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config

COPY ${WORKSPACE}/openssh-server/base/entrypoint.sh /

EXPOSE 2222

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/sbin/sshd", "-D"]