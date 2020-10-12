#!/bin/bash

set -e

# install build tools
sudo apk add gcc musl-dev git make rust cargo

# clone source
repo=sigp/discv5
branch=version-5.1
if [ ! -d discv5 ]; then
    git clone --branch "$branch" "https://github.com/$repo"
else
    ( cd discv5; git pull )
fi

# build it
cd discv5
cargo build --example simple_server
