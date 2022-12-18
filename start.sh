#!/usr/bin/env sh
docker run -d -v "$(pwd)"/data/hosts.d:/hosts.d -v "$(pwd)"/data/etc/dnsmasq.d:/etc/dnsmasq.d andrewjdawes/dnsmasq