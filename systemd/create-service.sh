#!/usr/bin/env bash

set -e

BASEDIR=$(dirname "$0")

ETHERMINTD_BINARY=$(which planqd || (echo -e "\033[31mPlease add planqd to PATH\033[0m" 1>&2 && exit 1))
ETHERMINTD_USER=$USER
ETHERMINTD_BINARY_DIR=$(dirname $(which planqd))
ETHERMINTD_USER_HOME=$(eval echo "~$USER")

sed "s#<ETHERMINTD_BINARY>#$ETHERMINTD_BINARY#g; s#<ETHERMINTD_USER>#$ETHERMINTD_USER#g; s#<ETHERMINTD_BINARY_DIR>#$ETHERMINTD_BINARY_DIR#g; s#<ETHERMINTD_USER_HOME>#$ETHERMINTD_USER_HOME#g" $BASEDIR/planqd.service.template > $BASEDIR/planqd.service

echo -e "\033[32mGenerated $BASEDIR/planqd.service\033[0m"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  sudo cp $BASEDIR/planqd.service /etc/systemd/system/planqd.service
  sudo systemctl daemon-reload
  sudo systemctl enable planqd.service
  echo -e "\033[32mCreated /etc/systemd/system/planqd.service\033[0m"
else
  echo -e "\033[31mCan only create /etc/systemd/system/planqd.service for linux\033[0m" 1>&2
  exit 1
fi
