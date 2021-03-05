#!/bin/bash
apk --no-cache add curl jq
DOWNLOAD_URL=$(curl -sL https://api.github.com/repos/HotaruBlaze/goTES3MP/releases/tags/${RELEASE_VERSION} | jq -r ".assets[] | select(.name | contains(\"goTES3MP-Linux\")) | .browser_download_url")
curl -O -J -L $DOWNLOAD_URL
cp -r ./goTES3MP-Linux /mnt/server/goTES3MP-Linux
chmod 755 /mnt/server/goTES3MP-Linux