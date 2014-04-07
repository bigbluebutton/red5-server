#!/bin/bash

set -x


#RED5_SRC=/home/firstuser/dev/red5/red5
RED5_SRC=$(pwd)
RED5_VER=1.0.2-M1
RED5_TARGET=red5-server-${RED5_VER}
RED5_DIR=/usr/share/red5
NEW_RED5=/usr/share/$RED5_TARGET


echo "Deploying red5"
cd $RED5_SRC

sudo rm $RED5_DIR
sudo rm -rf $NEW_RED5
sudo mv target/$RED5_TARGET $NEW_RED5
sudo ln -s $NEW_RED5 $RED5_DIR
sudo chmod -R 777 $NEW_RED5/webapps/

echo "Red5 ready"

