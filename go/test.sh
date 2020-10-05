#!/bin/sh

exec ~vagrant/bin/devp2p discv5 test -listen1 192.168.3.21 -listen2 192.168.4.21 $@
