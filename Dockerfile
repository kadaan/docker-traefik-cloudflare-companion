FROM docker.io/tiredofit/alpine:3.15
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

### Set Environment Variables
ENV CONTAINER_ENABLE_MESSAGING=FALSECONTAINER_ENABLE_MESSAGING=FALSE

### Dependencies
RUN set -x && \
    apk update && \
    apk upgrade && \
    apk add -t .tcc-build-deps \
                cargo \
                gcc \
                libffi-dev \
                musl-dev \
                openssl-dev \
                py-pip \
                py3-setuptools \
                py3-wheel \
                python3-dev \
                && \
    \
    apk add -t .tcc-run-deps \
                py3-beautifulsoup4 \
                py3-certifi \
                py3-chardet \
                py3-idna \
                py3-openssl \
                py3-requests \
                py3-soupsieve \
                py3-urllib3 \
                py3-websocket-client \
                py3-yaml \
                python3 \
                && \
    \
    pip install \
            cloudflare \
            get-docker-secret \
            docker[tls] \
            && \
    \
### Cleanup
    apk del .tcc-build-deps && \
    rm -rf /root/.cache /root/.cargo && \
    rm -rf /var/cache/apk/*

### Add Files
ADD install /
