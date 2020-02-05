FROM scratch

COPY ./bin/zbctl-cli.linux /zbctl
ENV PATH=/
COPY ./certs/ca-certificates.crt /etc/ssl/certs/
ENTRYPOINT ["/zbctl"]
