#!/usr/bin/env bash

VERSION=$(cat package.json | grep version | cut -c15-19)
FOLDER=sparqling-standalone-"$VERSION"

mkdir $FOLDER

cp sparqling-ws-1.0.0.jar $FOLDER
cp -r ui $FOLDER
cp base/run.sh $FOLDER
chmod +x $FOLDER/run.sh
cp base/run.bat $FOLDER
cp base/logback.xml $FOLDER

zip -r "sparqling-standalone-$VERSION.zip" $FOLDER

echo "version=$VERSION" >> $GITHUB_ENV
