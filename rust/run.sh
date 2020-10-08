#!/bin/sh

args=`getopt p:b: $*`
if [ $? != 0 ]
then
    echo 'Usage: run.sh -p <port> -b <bootnode>'
    exit 2
fi

port=9000
bootnode=""
set -- $args
for i
do
    case "$i"
    in
        -b) bootnode="$2"; shift; shift;;
        -p) port="$2"; shift; shift;;
        --) shift; break;;
    esac
done

export RUST_LOG=discv5=debug
exec ~vagrant/discv5/target/debug/examples/find_nodes 192.168.3.51 $port true $bootnode
