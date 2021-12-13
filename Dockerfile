FROM python:alpine as builder
RUN apk update && \
    apk add python3-dev gcc libc-dev libffi-dev
COPY requirements.txt /requirements.txt
RUN pip install --user -r /requirements.txt

FROM python:alpine
COPY --from=builder /root/.local /root/.local
COPY entrypoint.sh healthcheck.sh install/usr/sbin/cloudflare-companion /
ENTRYPOINT ["/entrypoint.sh"]