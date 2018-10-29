FROM busybox

WORKDIR /frp

ENV FRP_VERSION 0.21.0
RUN wget https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && tar -xf frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && cp frp_${FRP_VERSION}_linux_amd64/frps* . \
    && rm -rf frp_${FRP_VERSION}_linux_amd64* \
    && mkdir /conf \
    && mv /frp/frps.ini /conf

VOLUME /conf
EXPOSE 7000
ENTRYPOINT ["./frps","-c","/conf/frps.ini"]