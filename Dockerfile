FROM alpine:latest
MAINTAINER huangxiang6

WORKDIR /opt
ENV FRP_VERSION 0.30.0

RUN set -x && \
        wget --no-check-certificate https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz && \ 
        tar xzf frp_${FRP_VERSION}_linux_amd64.tar.gz && \
        mkdir -p /opt/frp && \
        mv frp_${FRP_VERSION}_linux_amd64/frpc /usr/local/bin/ && \
        chmod +x /usr/local/bin/frpc && \
        rm -rf -rf /var/cache/apk/* ~/.cache frp_${FRP_VERSION}_linux_amd64.tar.gz frp_${FRP_VERSION}_linux_amd64

VOLUME /opt/frp

CMD frpc -c /opt/frp/frpc.ini