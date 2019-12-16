# awslocal on Docker
Dockerized version of [awscli-local](https://github.com/localstack/awscli-local) - this is alias for aws cli
when you use [localstack](https://github.com/localstack/localstack).

## Example of usage in docker-compose.yml

```yaml
version: '3.5'

services:
  localstack:
    image: localstack/localstack:0.10.5
    ports:
      - "4567-4597:4567-4597"
      - "8090:8090"
    environment:
      - SERVICES=dynamodb
      - PORT_WEB_UI=8090
      - DOCKER_HOST=unix:///var/run/docker.sock
      - DEFAULT_REGION=eu-central-1
      - HOSTNAME_EXTERNAL=localstack

    volumes:
      - "~/tmp/localstack:/tmp/localstack"
      - "/var/run/docker.sock:/var/run/docker.sock"
    networks:
      - localstack-network

  localstack-setup:
    image: mejt/aws-local
    depends_on:
      - localstack
    environment:
      - LOCALSTACK_HOST=localstack
      - AWS_DEFAULT_REGION=eu-central-1
    volumes:
      - "./init-localstack.sh:/entrypoint.sh"
    entrypoint: ["/entrypoint.sh"]
    networks:
      - localstack-network

networks:
  localstack-network:
    driver: "bridge"
```
