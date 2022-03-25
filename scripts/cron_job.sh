#!/bin/bash

chmod +x ./db/postgres_backup.sh
mkdir /var/log/postgres/
(crontab -l && echo "0 */6 * * * /home/ubuntu/exadel-final-project/scripts/db/postgres_backup.sh >> /var/log/postgres/backup_postgres.txt 2>&1") | crontab -
systemctl restart cron.service