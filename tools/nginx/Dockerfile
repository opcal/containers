FROM nginx:latest

LABEL org.opencontainers.image.authors="opcal@outlook.com"

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && apt-get -y install logrotate cron \
    && apt-get clean \
    && apt-get -y autoclean \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

COPY tools/nginx/conf/nginx-crontab /etc/cron.d/nginx-crontab
COPY tools/nginx/conf/nginx-data-logrotate /etc/nginx/

RUN chmod 0644 /etc/cron.d/nginx-crontab; \
    crontab /etc/cron.d/nginx-crontab; \
    chmod 0644 /etc/nginx/nginx-data-logrotate

CMD cron && nginx -g 'daemon off;'
