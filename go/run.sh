#!/bin/sh

exec ~vagrant/bin/devp2p --vmodule=p2p/discover=5 discv5 listen $@
