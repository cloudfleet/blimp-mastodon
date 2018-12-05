FROM tootsuite/mastodon

REDIS_HOST=redis
REDIS_PORT=6379
DB_HOST=db
DB_USER=postgres
DB_NAME=postgres
DB_PASS=
DB_PORT=5432
ES_ENABLED=true
ES_HOST=es
ES_PORT=9200

SINGLE_USER_MODE=true

# E-mail configuration
# Note: Mailgun and SparkPost (https://sparkpo.st/smtp) each have good free tiers
# If you want to use an SMTP server without authentication (e.g local Postfix relay)
# then set SMTP_AUTH_METHOD and SMTP_OPENSSL_VERIFY_MODE to 'none' and
# *comment* SMTP_LOGIN and SMTP_PASSWORD (leaving them blank is not enough).
SMTP_SERVER=smtp.mailgun.org
SMTP_PORT=587
SMTP_LOGIN=
SMTP_PASSWORD=
#SMTP_DOMAIN= # defaults to LOCAL_DOMAIN
#SMTP_DELIVERY_METHOD=smtp # delivery method can also be sendmail
#SMTP_AUTH_METHOD=plain
#SMTP_CA_FILE=/etc/ssl/certs/ca-certificates.crt
#SMTP_OPENSSL_VERIFY_MODE=peer
#SMTP_ENABLE_STARTTLS_AUTO=true
#SMTP_TLS=true

# LDAP authentication (optional)
# LDAP_ENABLED=true
# LDAP_HOST=localhost
# LDAP_PORT=389
# LDAP_METHOD=simple_tls
# LDAP_BASE=
# LDAP_BIND_DN=
# LDAP_PASSWORD=
# LDAP_UID=cn
# LDAP_SEARCH_FILTER="%{uid}=%{email}"


# http_proxy=http://privoxy:8118
# ALLOW_ACCESS_TO_HIDDEN_SERVICE=true
