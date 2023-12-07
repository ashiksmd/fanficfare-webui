# A lightweight Dockerised web frontend for FanFicFare

Written in go! Uses the most recent release of FanFicFare at time of building.

Docker run example: `docker run -p 80:80 ghcr.io/ashiksmd/fanficfare-webui:master`

Docker-compose deployment:

```yaml
version: "3.7"

services:
  fanficfare:
    image: ghcr.io/ashiksmd/fanficfare-webui:master
    container_name: fanficfare
    environment:
      - PUID=1001
      - PGID=1001
      - TZ=America/Los_Angeles
    ports:
      - "6001:80"
    restart: unless-stopped
    volumes:
      - /path/to/books:/fanficfare/books
    network_mode: bridge

```

Uses FanFicFare - see their Original Repo: [FanFicFare](https://github.com/JimmXinu/FanFicFare)
