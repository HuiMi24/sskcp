# Stage 1: Build
FROM golang:1.17 as v2ray_build
WORKDIR /v2ray-plugin
RUN go get github.com/shadowsocks/v2ray-plugin
COPY . /v2ray-plugin
RUN go build -o /v2ray-plugin/v2ray-plugin

# Stage 2: Production
FROM debian:buster-slim
WORKDIR /

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends shadowsocks-libev curl procps && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the built binary from the build stage
COPY --from=v2ray_build /v2ray-plugin/v2ray-plugin /v2ray-plugin
