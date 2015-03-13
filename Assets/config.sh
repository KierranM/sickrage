#!/bin/bash
# move into sickrage directory
cd /sickrage
# update sickrage
git pull

CONFIG="/config/sickrage"

if [[ ! -f $CONFIG/config.ini ]]; then
  # copy the file to the config directory, making it if necessary
  mkdir -p $CONFIG
  cp -a /tmp/config.ini $CONFIG/config.ini
fi

if [[ -n ${USERNAME} ]]; then
  echo "The username is: ${USERNAME}"
  sed -i -e "s#\(.*\"sickrage-user\":\).*#\1 ${USERNAME},#g" $CONFIG/config.ini
fi

if [[ -n ${PASSWORD} ]]; then
  echo "The password is: ${PASSWORD}"
  sed -i -e "s#\(.*\"sickrage-password\":\).*#\1 ${PASSWORD},#g" $CONFIG/config.ini
fi
