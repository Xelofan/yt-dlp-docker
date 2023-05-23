#!/bin/sh
COMMAND="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' -o /home/linuxbrew/app/'$OUTPUT' '$URL'"
while true
do
    echo -e "[docker] Trying to download the specified URL.."; \
    bash -c "$COMMAND"; \
    echo "[docker] Sleeping for $WAIT seconds.."; \
    sleep $WAIT;
done
