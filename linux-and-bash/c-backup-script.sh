#!/bin/bash

SOURCE_PATH=$1
DEST_PATH=$2
LOG_PATH=$(pwd)/c-backup-$(date +%Y-%b-%d).log

if [ $# -lt 1 ]
	then
	echo "Error: must be min 2 arguments: ./c-backup-script.sh Source path Destignation path [LOG_PATH]"
	exit 1
fi

if [ $# -ge 3 ]
	then
	LOG_PATH=$3
fi

if ! [ -d $SOURCE_PATH ]
	then
	echo "Error: Source path does not exist!"
	exit 1
fi
if ! [ -d $DEST_PATH ]
	then
	echo "Error: Destignation path does not exist!"
	exit 1
fi

rsync -cazv --delete --delete-after --log-file=$LOG_PATH $SOURCE_PATH $DEST_PATH
