FROM alpine:edge

ADD https://github.com/openfaas/faas/releases/download/v0.5-alpha/fwatchdog /usr/bin
RUN chmod +x /usr/bin/fwatchdog

RUN set -xe && apk update && apk add --no-cache jpegoptim=1.4.4-r0

ENV JPEG_QUALITY=80
ENV QUALITY_THRESHOLD=1

ENV fprocess="jpegoptim --quiet -p -P --max=${JPEG_QUALITY} --threshold=${QUALITY_THRESHOLD} --strip-all --stdin --stdout"

EXPOSE 8080
ENV http_proxy      ""
ENV https_proxy     ""

CMD ["fwatchdog"]
