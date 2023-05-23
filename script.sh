#!/bin/sh

chown $UID:$GID /data
COMMAND="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' -o /data/'$OUTPUT' '$URL'"

while true; do
    echo -e "[docker] Trying to download the specified URL.."; \
    su $USER -c "$COMMAND"; \
    echo "[docker] Sleeping for $WAIT seconds.."; \
    sleep $WAIT;
done