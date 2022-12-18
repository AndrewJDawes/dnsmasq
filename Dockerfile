FROM ubuntu:latest
EXPOSE 53/udp
EXPOSE 53/tcp
RUN apt update
RUN apt install dnsmasq -y
WORKDIR /app
COPY dnsmasq.conf /etc/dnsmasq.conf
ENTRYPOINT ["dnsmasq"]
CMD ["--no-hosts", "--hostsdir=/app/hosts.d", "--keep-in-foreground"]