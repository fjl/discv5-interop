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
        -b) bootnode="--bootnode:$2"; shift; shift;;
        -p) port="$2"; shift; shift;;
        --) shift; break;;
    esac
done

exec ~vagrant/bin/dcli \
     --log-level:trace \
     --nat:extip:192.168.3.31 \
     --udp-port:$port $bootnode $@
