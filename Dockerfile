FROM ghcr.io/jauderho/yt-dlp:2024.08.01

ENV UID=1000 \
    GID=1000 \
    USER=ytdlpdocker


RUN addgroup \
    --g $GID \
    $USER

RUN adduser \
    --disabled-password \
    --gecos "" \
#    --no-create-home \
    --ingroup $USER \
    --uid $UID \
    $USER

ENV WAIT=300 \
    URL= \
    OUTPUT="%(title)s.%(ext)s"

COPY script.sh /
RUN chmod +x /script.sh

WORKDIR /data
VOLUME [ "/data" ]
RUN chown $USER:$USER /data

USER $USER

CMD [ "/script.sh" ]