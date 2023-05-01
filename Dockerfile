FROM golang:latest as builder
RUN go install honnef.co/go/nut/cmd/nut_exporter@latest

FROM debian:stable-slim
COPY --from=builder /go/bin/nut_exporter /bin/nut_exporter
ENTRYPOINT [ "/bin/nut_exporter" ]
EXPOSE 9230
