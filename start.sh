#!/usr/bin/env bash
if [ -f "getenv.sh" ]; then
    source getenv.sh
fi
eval_cmd="docker run \
-d \
--name $PROJECT_DOCKER_CONTAINER_NAME \
-p 53:53/udp \
-p 53:53/tcp \
-v "$(pwd)"/data/app/hosts.d:/app/hosts.d \
-v "$(pwd)"/data/etc/dnsmasq.d:/etc/dnsmasq.d \
$PROJECT_DOCKER_FULL_PATH
"
eval "$eval_cmd"