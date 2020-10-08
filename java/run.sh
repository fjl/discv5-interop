#!/bin/bash

args=`getopt p:b: $*`
if [ $? != 0 ]
then
    echo 'Usage: run.sh -p <port> -b <bootnode>'
    exit 2
fi

port=9000
bootnodes=""
set -- $args
for i
do
    case "$i"
    in
        -b) bootnodes="$bootnodes ${2#enr:}"; shift; shift;;
        -p) port="$2"; shift; shift;;
        --) shift; break;;
    esac
done

cd ~vagrant/discovery
exec ./gradlew -q runTestDiscovery --args="192.168.3.61 $port $port $bootnodes"
