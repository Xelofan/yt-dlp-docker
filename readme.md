## YT-DLP in Docker

### Why does this exist ?
I needed a simple Docker image to automatically download a stream that I specify when it's live, and check for it when it's not.
### Using the image (Docker cli, example)
```bash
docker run -d \
  -e UID=1000 -e GID=1000 \
  -e WAIT=300 \
  -e URL=<REPLACE_WITH_URL> \
  -v $(pwd):/data \
  ghcr.io/xelofan/yt-dlp-docker
```
### Using the image (Docker Compose, example)
```yaml
version: '3'

services:
  yt-dlp-docker:
    image: ghcr.io/xelofan/yt-dlp-docker
    container_name: yt-dlp-docker
    restart: unless-stopped
    environment:
      URL: <REPLACE_WITH_URL>
      UID: 1000   #example
      GID: 1000   #example
      WAIT: 300   #example
    volumes:
      - .:/data # downloads to the directory where the docker-compose.yml file is located
```

Environment variables

| Name   | Mandatory ? | Default value | Description |
| :----: | :---------: | :-----------: | :---------- |
| URL    | **YES**     |               | URL which the script will download from. Between quotation marks (ie.: "URL"). **Remove backslashes *(\\)*!** |
| UID    | no          | 1000          | User ID that runs the script. **(you should set it to your ID)** |
| GID    | no          | 1000          | Group ID that runs the script. **(you should set it to your ID)** |
| WAIT   | no          | 300           | Delay between retries defined in seconds. |
| OUTPUT | no          | "%(title)s.%(ext)s" *(name_of_the_video.ext)* | Format in which the result file's name will be. |
