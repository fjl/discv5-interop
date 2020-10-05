#!/bin/bash

set -e

# install C compiler and other build tools
sudo apk add gcc musl-dev go make git

# clone go discv5
repo=fjl/go-ethereum
branch=p2p-discover-v5-new-format
if [ ! -d go-ethereum ]; then
   git clone --branch "$branch" "https://github.com/$repo"
fi
cd go-ethereum

# build it
mkdir -p ~vagrant/bin
go build -o ~vagrant/bin/devp2p ./cmd/devp2p
