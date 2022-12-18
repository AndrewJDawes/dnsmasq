FROM ubuntu:latest
RUN apt update
RUN apt install dnsmasq -y
COPY dnsmasq.conf /etc/dnsmasq.conf
ENTRYPOINT ["dnsmasq"]
CMD ["--no-hosts", "--hostsdir=/hosts.d", "--keep-in-foreground","--log-queries"]