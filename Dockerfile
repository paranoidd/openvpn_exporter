FROM golang:1.14-buster AS builder

RUN mkdir -p /go/src/openvpn-exporter
COPY . /go/src/openvpn-exporter
WORKDIR /go/src/openvpn-exporter
RUN go build

FROM scratch

COPY --from=builder /go/src/openvpn-exporter/openvpn_exporter /bin/openvpn_exporter
ENTRYPOINT ["/bin/openvpn_exporter"]
CMD [ "-h" ]
