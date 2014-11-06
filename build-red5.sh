#!/bin/bash

set -x

RED5_SRC=$(pwd)
RED5_VER=1.0.4-SNAPSHOT
RED5_DIR=red5-server-${RED5_VER}

echo "Preparing build"
mvn clean

echo "mvn bootstrap install"
mvn bootstrap install
echo "mvn dependencies"
mvn dependency:copy-dependencies
echo "mvn package"
mvn -Dmaven.test.skip=true -Dmaven.buildNumber.doUpdate=false package

cd $RED5_SRC/target
echo "Extractring red5"
tar zxvf red5-server-${RED5_VER}-server.tar.gz

cp $RED5_SRC/extras/commons-fileupload-1.2.2.jar $RED5_DIR/lib
cp $RED5_SRC/extras/commons-io-2.0.jar $RED5_DIR/lib

echo "Creating log and work dirs"
mkdir $RED5_DIR/log
mkdir $RED5_DIR/work

sudo chown red5.adm $RED5_DIR/log
sudo chown red5.adm $RED5_DIR/work
sudo mkdir $RED5_DIR/diagnostics
sudo chown red5.adm $RED5_DIR/diagnostics

echo "Done."
cd $RED5_SRC

