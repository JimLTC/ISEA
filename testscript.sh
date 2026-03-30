#!/bin/bash
now=$(date +"%d_%m_%y")
cp -R /home/isealab/Documents/* /home/isealab/backup/
zip -r /home/isealab/$now.zip /home/isealab/backup/
echo "Backup completed: $now" >> /var/log/task.log
