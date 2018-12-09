#!/bin/bash

set -x

RED5_SRC=$(pwd)
RED5_SERVER=${RED5_SRC}/target/red5-server
RED5_JAR=${RED5_SERVER}/red5-server.jar
RED5_JAR_VER=red5-1.0r4643.jar


cd $RED5_SRC

MIN_APP=/home/firstuser/dev/bbb/bbb-red5-test/server

echo "Building minimal app"
cd $MIN_APP
cp $RED5_JAR $MIN_APP/lib/$RED5_JAR_VER
gradle resolveDeps
gradle clean war

cp -R build/bbbtest $RED5_SERVER/webapps

cd $RED5_SRC

