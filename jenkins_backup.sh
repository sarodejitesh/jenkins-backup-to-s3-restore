#!/bin/bash
TIMESTAMP=$(date +"%F-%H-%M-%S")
BACKUP_FILE="/tmp/jenkins-backup-$TIMESTAMP.tar.gz"

# Compress Jenkins directory
tar -czvf $BACKUP_FILE /var/lib/jenkins

# Upload to S3
aws s3 cp $BACKUP_FILE s3://jenkins-backup-technova/

# Cleanup local backup
rm -f $BACKUP_FILE
