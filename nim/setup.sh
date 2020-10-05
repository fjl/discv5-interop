#!/bin/bash

set -e

# install C compiler and other build tools
sudo apk add gcc musl-dev make git

# install nim compiler
(
    if [ -f /usr/local/bin/nimble ]; then
        echo "Skipping Nim compiler build."
        exit
    fi
    set -e

    # download nim
    base=nim-1.2.6
    archive=$base-linux_x64.tar.xz
    curl -C - -o "$archive" "https://nim-lang.org/download/$archive"
    echo "54b8322e029ed5529de7ea80016ef8b8b5c12f33e7f3594d9b70552dde509f1f  $archive" | sha256sum -c
    tar xf $archive

    # bootstrap nim compiler
    cd $base
    make
    sudo ./install.sh /usr/local/bin
    nim c koch
    ./koch boot -d:release
    ./koch tools
    sudo cp bin/* /usr/local/bin
)

# clone nim discv5
repo=status-im/nim-eth
branch=discv5-v1
if [ ! -d nim-eth ]; then
    git clone --branch "$branch" "https://github.com/$repo"
else
    ( cd nim-eth; git pull )
fi

# build it
cd nim-eth
nimble install -y
nim c -d:chronicles_log_level:trace -d:release -d:UseDiscv51:true --threads:on eth/p2p/discoveryv5/dcli

# copy it to bin
mkdir -p ~vagrant/bin
cp ./eth/p2p/discoveryv5/dcli ~vagrant/bin
