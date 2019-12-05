FROM alpine:3.6

ENV LOCALSTACK_HOST="localhost"
ENV USE_SSL=false

RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less \
        jq

RUN pip install --upgrade pip

RUN pip install --upgrade awscli s3cmd==2.0.1 python-magic && \
    pip install --upgrade awscli-local

RUN apk -v --purge del py-pip && \
    rm /var/cache/apk/*

VOLUME /root/.aws
WORKDIR /aws

CMD sh
ENTRYPOINT ["aws"]
