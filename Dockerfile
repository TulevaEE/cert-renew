FROM alpine:3.12

RUN apk add --update gcc musl-dev openssl-dev libffi-dev build-base
RUN apk add --update py3-pip python3-dev git bash openssl curl
RUN ln -s $(which python3) /usr/bin/python
RUN pip3 install awscli --upgrade

RUN git clone https://github.com/dehydrated-io/dehydrated
WORKDIR dehydrated
RUN mkdir hooks
RUN git clone https://github.com/walcony/letsencrypt-cloudflare-hook hooks/cloudflare
RUN pip3 install -r hooks/cloudflare/requirements.txt
COPY config config
COPY domains.txt domains.txt
COPY script.sh script.sh
RUN chmod a+x script.sh

ENTRYPOINT ["./script.sh"]
