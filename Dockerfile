FROM certbot/dns-cloudflare:latest

RUN pip3 install awscli --upgrade
RUN apk update && apk add gettext

COPY cloudflare.ini.template /root/.secrets/cloudflare.ini.template
COPY entrypoint.sh entrypoint.sh
RUN chmod a+x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]