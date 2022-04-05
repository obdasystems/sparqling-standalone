#!/usr/bin/env bash

VERSION=$(cat package.json | grep version | cut -c15-19)
FOLDER=sparqling-standalone-"$VERSION"
BASE_VERSION=base

rm -r $MONOLITH_FOLDER
mkdir $MONOLITH_FOLDER

cp sparqling-ws-1.0.0.jar $FOLDER
cp -r ui $FOLDER
cp $BASE_VERSION/run.sh $FOLDER
chmod +x $FOLDER/run.sh
cp $BASE/run.bat $FOLDER
cp $BASE/logback.xml $FOLDER

zip -r "sparqling-standalone-$VERSION.zip" $FOLDER

echo "version=$VERSION" >> $GITHUB_ENV
