#!/usr/bin/env bash

VERSION=$(cat package.json | grep -m 1 version | cut -c15-19)
FOLDER=sparqling-standalone-"$VERSION"

mkdir $FOLDER

cp sparqling-ws-1.0.0.jar $FOLDER
cp -r ui $FOLDER
cp base/run.sh $FOLDER
chmod +x $FOLDER/run.sh
cp base/run.command $FOLDER
chmod +x $FOLDER/run.command
cp base/run.bat $FOLDER
cp base/logback.xml $FOLDER
cp -r base/resources $FOLDER

zip -r "sparqling-standalone-$VERSION.zip" $FOLDER

echo "version=$VERSION" >> $GITHUB_ENV
