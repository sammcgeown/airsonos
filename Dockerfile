FROM debian:stable
LABEL maintainer="sam@mcgeown.co.uk"

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Copy root filesystem
COPY rootfs /

ARG BUILD_ARCH=amd64
# Download the binary
RUN apt-get update -y && apt-get install curl -y && \
    curl https://github.com/hassio-addons/addon-airsonos/raw/main/airsonos/bin/airsonos-${BUILD_ARCH} -o /usr/bin/airsonos && \
    chmod +x /usr/bin/airsonos && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "/usr/bin/airsonos", "-x '/config/airsonos.xml'", "-d 'all=debug'", "-l '${LATENCY_RTP}:${LATENCY_HTTP}'" ]