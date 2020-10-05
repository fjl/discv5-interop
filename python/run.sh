#!/bin/sh

exec ~vagrant/ddht/venv/bin/ddht --disable-jsonrpc '' --disable-upnp --ephemeral --port 30303 --listen-address 192.168.3.41 --protocol-version v5.1 $@
