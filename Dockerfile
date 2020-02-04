FROM scratch

COPY ./bin/zbctl-cli.linux /zbctl
ENV PATH=/
CMD ["/zbctl"]