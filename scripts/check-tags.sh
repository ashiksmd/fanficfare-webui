#!/bin/sh

username="ashiksmd"
repo="${1:-ashiksmd/fanficfare-webui}"
ghcr_token=$(cat $HOME/.docker/config.json | jq ".auths" | jq ".ghcrio" | jq -r ".auth")
token=$(curl -s "https://ghcr.io/token?service=ghcr.io&scope=repository:${repo}:pull" \
             -u "${username}:${ghcr_token}" \
        | jq -r '.token')
curl -H "Authorization: Bearer $token" \
     -s "https://ghcr.io/v2/${repo}/tags/list" | jq .
