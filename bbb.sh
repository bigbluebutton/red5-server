#!/bin/bash

#RED5_SRC=/home/firstuser/dev/red5/red5

set -x

RED5_SRC=$(pwd)
RED5_VER=1.0.4-RELEASE
WHOAMI=$(whoami)

RED5_DIR=/usr/share/red5

cd $RED5_SRC

DESKSHARE=/home/$WHOAMI/dev/bigbluebutton/deskshare
VOICE=/home/$WHOAMI/dev/bigbluebutton/bbb-voice
VIDEO=/home/$WHOAMI/dev/bigbluebutton/bbb-video
APPS=/home/$WHOAMI/dev/bigbluebutton/bigbluebutton-apps

echo "Building apps"
cd $APPS
gradle resolveDeps
gradle clean war deploy

echo "Building voice"
cd $VOICE
gradle resolveDeps
gradle clean war deploy

echo "Building video"
cd $VIDEO
gradle resolveDeps
gradle clean war deploy

echo "Building deskshare"
cd $DESKSHARE
gradle resolveDeps
cd $DESKSHARE/app
gradle clean war deploy

cd $RED5_SRC

sudo chown -R red5.adm $RED5_DIR
sudo chmod -R 777 $RED5_DIR/webapps/

