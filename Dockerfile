FROM alpine:latest

RUN apk add --update gcc musl-dev openssl-dev libffi-dev
RUN apk add --update py-pip python-dev git bash openssl curl
RUN pip install awsebcli pyOpenSSL --upgrade

RUN git clone https://github.com/lukas2511/dehydrated
WORKDIR dehydrated
RUN mkdir hooks
RUN git clone https://github.com/kappataumu/letsencrypt-cloudflare-hook hooks/cloudflare
RUN pip install -r hooks/cloudflare/requirements.txt
COPY config config
COPY domains.txt domains.txt
COPY script.sh script.sh
RUN chmod a+x script.sh

ENTRYPOINT ["./script.sh"] 