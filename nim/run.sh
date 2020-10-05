#!/bin/sh

exec ~vagrant/bin/dcli --log-level:trace --nat:extip:192.168.3.31 $@
