FROM tootsuite/mastodon:latest

ENV REDIS_HOST=mastodonredis
ENV REDIS_PORT=6379
ENV DB_HOST=mastodonpostgres
ENV DB_USER=postgres
ENV DB_NAME=postgres
ENV DB_PASS=
ENV DB_PORT=5432

#ENV ES_ENABLED=true
#ENV ES_HOST=mastodonelastic
#ENV ES_PORT=9200

ENV SINGLE_USER_MODE=true

ENV SMTP_SERVER=smtp.mailgun.org
ENV SMTP_PORT=587
ENV SMTP_LOGIN=
ENV SMTP_PASSWORD=

COPY entrypoint*.sh /

USER root

ENTRYPOINT ["/sbin/tini", "--", "/entrypoint-root.sh"]
