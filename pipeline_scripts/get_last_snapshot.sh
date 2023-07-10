#! /bin/sh

aws rds describe-db-snapshots --snapshot-type awsbackup > snapshots.json

ENERBRAIN_SNAPSHOT_ARN=$(jq -r '.DBSnapshots[].DBSnapshotArn' snapshots.json)

echo $ENERBRAIN_SNAPSHOT_ARN

export ARN=$ENERBRAIN_SNAPSHOT_ARN