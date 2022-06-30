FROM alpine:3.16
LABEL maintainer="sam@mcgeown.co.uk"

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Copy root filesystem
COPY rootfs /

# Download the binary
RUN curl https://github.com/hassio-addons/addon-airsonos/raw/main/airsonos/bin/airsonos-aarch64 -o /usr/bin/airsonos