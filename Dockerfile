FROM python:3.7.4-slim-stretch

ARG GITMAN_VERSION=1.7

RUN ( \
    apt-get update && apt-get install -y git openssh-client; \
    set -eux; \
    pip install gitman==${GITMAN_VERSION} --no-cache-dir; \
)
ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

CMD [ "gitman" ]

LABEL \
    org.label-schema.schema-version=1.0.0 \
    org.label-schema.version=${GITMAN_VERSION} \
    org.label-schema.name="marcellodesales/gitman" \
    org.label-schema.license="Apache 2 License" \
    org.label-schema.url="https://github.com/marcellodesales" \
    org.label-schema.vcs-url="https://github.com/marcellodesales/docker-gitman" \
