#!/bin/sh

args=`getopt p:b: $*`
if [ $? != 0 ]
then
    echo 'Usage: run.sh -p <port> -b <bootnode>'
    exit 2
fi

port=9000
bootnode="--bootnodes="
set -- $args
for i
do
    case "$i"
    in
        -b) bootnode="--bootnodes=$2"; shift; shift;;
        -p) port="$2"; shift; shift;;
        --) shift; break;;
    esac
done

exec ~vagrant/bin/devp2p --vmodule=p2p/discover=5 discv5 listen \
     --addr 192.168.3.21:$port $bootnode $@
