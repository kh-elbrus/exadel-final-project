#!/bin/bash

mkdir $BACKUP_DIR
echo $POSTGRES_PASSWORD > ~/.pgpass && chmod 600 ~/.pgpass
export PGPASSFILE=~/.pgpass
pg_dump -U $POSTGRES_USER -h $POSTGRES_HOST $POSTGRES_DB > $BACKUP_DIR/backup-$(date +"%m-%d-%Y-%H-%M").sql
aws s3 cp $BACKUP_DIR/backup-$(date +"%m-%d-%Y-%H-%M").sql $S3_BACKUP_PATH

