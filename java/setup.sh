#!/bin/bash

set -e

# install build tools
sudo apt-get update
sudo apt-get install -y git openjdk-11-jdk-headless net-tools

# clone java discv5
repo=Nashatyrev/discovery
branch=feature/v5.1-last-updates-1
if [ ! -d discovery ]; then
    git clone --branch "$branch" "https://github.com/$repo"
else
    ( cd discovery; git pull )
fi

# build it
cd discovery
./gradlew compileJava
