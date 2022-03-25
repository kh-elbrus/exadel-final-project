#!/bin/bash

docker exec -i postgres sh -c "pg_dump -U postgres web-app | gzip > /db_backup/dump_`date +%d-%m-%Y"_"%H_%M_%S`.gz"