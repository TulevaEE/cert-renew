#!/bin/sh

set -e
set -o pipefail

envsubst < /root/.secrets/cloudflare.ini.template > /root/.secrets/cloudflare.ini

echo "Renewing certificate"

certbot certonly \
  --non-interactive \
  --agree-tos \
  --email tuleva@tuleva.ee \
  --dns-cloudflare \
  --dns-cloudflare-credentials ~/.secrets/cloudflare.ini \
  --dns-cloudflare-propagation-seconds 60 \
  -d pension.tuleva.ee \
  -d id.tuleva.ee \
  --staging

echo "Uploading new certificate"

aws s3 cp --recursive /etc/letsencrypt/live/pension.tuleva.ee "$SECRETS_BUCKET/ssl/staging"