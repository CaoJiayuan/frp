FROM busybox

WORKDIR /frp

ENV FRP_VERSION 0.21.0
RUN wget https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && tar -xf frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && cp frp_${FRP_VERSION}_linux_amd64/frpc* . \
    && rm -rf frp_${FRP_VERSION}_linux_amd64* \
    && mkdir /conf \
    && mv /frp/frpc.ini /conf

VOLUME /conf
ENTRYPOINT ["./frpc","-c","/conf/frpc.ini"]