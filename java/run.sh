#!/bin/sh

cd ~vagrant/discovery
exec ./gradlew -q runTestDiscovery --args="192.168.3.61 9001 $@"
