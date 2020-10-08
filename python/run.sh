#!/bin/sh

args=`getopt p:b: $*`
if [ $? != 0 ]
then
    echo 'Usage: run.sh -p <port> -b <bootnode>'
    exit 2
fi

port=9000
bootnode="--no-bootstrap"
set -- $args
for i
do
    case "$i"
    in
        -b) bootnode="--bootnode $2"; shift; shift;;
        -p) port="$2"; shift; shift;;
        --) shift; break;;
    esac
done

exec ~vagrant/ddht/venv/bin/ddht \
     --disable-jsonrpc '' --disable-upnp \
     --ephemeral \
     --protocol-version v5.1 \
     --listen-address 192.168.3.41 \
     --port $port $bootnode $@
