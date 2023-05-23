FROM alpine

RUN apk add ffmpeg youtube-dl --no-cache

ENV UID=1000 \
    GID=1000 \
    USER=docker
    

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
#RUN chown $USER:$USER /data

CMD [ "/script.sh" ]

#USER $USER