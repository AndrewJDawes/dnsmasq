# dnsmasq Docker Container

## Get started
- Clone the repo
- Recommended to copy `data/etc/dnsmasq.d/dnsmasq.conf.example/` to `data/etc/dnsmasq.d/dnsmasq.conf`
- Add one or more hosts files to `data/app/hosts.d`
- Example syntax:
```
127.0.0.1 my-site.com your-site.com
```

## Stop and disable systemd-resolved.service
You might see this error when starting the container:
```
Error response from daemon: driver failed programming external connectivity on endpoint dnsmasq...: Error starting userland proxy: listen tcp4 0.0.0.0:53: bind: address already in use.
```
This means you need to stop the `systemd-resolved.service`:
`sudo systemctl stop systemd-resolved.service && sudo systemctl disable systemd-resolved.service`
Restart the container
`docker restart dnsmasq`

## To re-enable systemd-resolved.service
`sudo systemctl start systemd-resolved.service && sudo systemctl enable systemd-resolved.service`

## Run a container
`/bin/bash start.sh`

## Add new hosts
- Add new files or new lines to existing files in `data/app/hosts.d`
- No container or service restart required

## Add new dnsmasq configuration options
- Add new files or new lines to existing files in `data/etc/dnsmasq.d`
- Restart the container: `docker restart dnsmasq`

## Extra Docker config options
- Copy `env.sh` to `.env.sh`
- Customize your config options there

