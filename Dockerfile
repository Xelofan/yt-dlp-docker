FROM homebrew/brew

RUN brew install yt-dlp ffmpeg
RUN brew cleanup -s --prune all

ENV WAIT=300 \
    URL= \
    OUTPUT="%(title)s.%(ext)s"

COPY --chown=linuxbrew:linuxbrew script.sh /home/linuxbrew/
RUN chmod +x /home/linuxbrew/script.sh

WORKDIR /home/linuxbrew/app
VOLUME [ "/home/linuxbrew/app" ]

CMD [ "bash", "/home/linuxbrew/script.sh" ]