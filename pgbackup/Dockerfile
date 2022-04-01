FROM ubuntu:20.04

ENV BACKUP_DIR=/home/postgres/backup

ENV TZ=Asia/Tashkent
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update
RUN apt install -y lsb-release wget awscli postgresql-client
RUN lsb_release -c -s > /tmp/lsb_release

RUN useradd -rm -d /home/postgres -s /bin/bash -g root -G sudo -u 1001 postgres

ADD docker-entrypoint.sh /home/postgres/docker-entrypoint.sh
RUN chmod +x /home/postgres/docker-entrypoint.sh && chown postgres /home/postgres/docker-entrypoint.sh

ENTRYPOINT ["/home/postgres/docker-entrypoint.sh"]
