FROM python:alpine

ENV LOCALSTACK_HOST="localhost"
ENV USE_SSL=false

RUN apk -uv add --no-cache groff jq less && \
    pip install awscli-local

WORKDIR /aws

CMD sh
