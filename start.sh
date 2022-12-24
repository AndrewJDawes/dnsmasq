#!/usr/bin/env bash
if [ -f "getenv.sh" ]; then
    source getenv.sh
fi
eval_cmd="docker run \
-d \
--name $PROJECT_DOCKER_CONTAINER_NAME \
--network host \
-v "$(pwd)"/data/app/hosts.d:/app/hosts.d \
-v "$(pwd)"/data/etc/dnsmasq.d:/etc/dnsmasq.d \
--restart=unless-stopped \
$PROJECT_DOCKER_FULL_PATH
"
# Below does not work because external requests will come in with the IP address assigned to host's network interface, not loopback
# eval_cmd="docker run \
# -d \
# --name $PROJECT_DOCKER_CONTAINER_NAME \
# -p 127.0.0.1:53:53/udp \
# -p 127.0.0.1:53:53/tcp \
# -v "$(pwd)"/data/app/hosts.d:/app/hosts.d \
# -v "$(pwd)"/data/etc/dnsmasq.d:/etc/dnsmasq.d \
# $PROJECT_DOCKER_FULL_PATH
# "
eval "$eval_cmd"