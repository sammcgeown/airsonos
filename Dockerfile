FROM debian:stable
LABEL maintainer="sam@mcgeown.co.uk"

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Copy root filesystem
COPY rootfs /

ARG BUILD_ARCH=amd64
COPY bin/airsonos-${BUILD_ARCH} /usr/bin/airsonos


#ENTRYPOINT [ "/usr/bin/airsonos", "-x '/config/airsonos.xml'", "-d 'all=debug'", "-l '${LATENCY_RTP}:${LATENCY_HTTP}'" ]