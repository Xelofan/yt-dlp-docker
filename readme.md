## YT-DLP in Docker

Environment variables

| Name   | Mandatory ? | Default value | Description |
| :----: | :---------: | :-----------: | :---------- |
| UID    | no          | 1000          | User ID that runs the script. **(you should set it to your ID)** |
| GID    | no          | 1000          | Group ID that runs the script. **(you should set it to your ID)** |
| WAIT   | no          | 300           | Delay between retires defined in seconds. |
| URL    | **YES**     |               | URL which the script will download from. Between quotation marks (ie.: "URL"). **Remove backslashes (\\)!** |
| OUTPUT | no          | "%(title)s.%(ext)s" *(name_of_the_video.ext)* | Format in which the result file's name will be. |