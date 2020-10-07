# Discovery v5 Testing Rig

This repo contains my testing setup for Discovery v5. The setup is based on vagrant, so if
you want to run this, you need to install vagrant first.

At this time, the supported client implementations are

- `go`: https://github.com/ethereum/go-ethereum
- `nim`: https://github.com/status-im/nim-eth
- `python`: https://github.com/ethereum/ddht
- `rust`: https://github.com/sigp/discv5
- `java`: https://github.com/PegaSysEng/discovery

Each client implementation has its own VM. The 'provisioning' step of the VM builds the
client from source and installs a wrapper script for configuring and running it.

The Vagrantfile assigns a unique static IP address to each client VM. The VMs can talk to
each other and to the host. All client IPs are on the 192.168.3.1/24 network. The host is
192.168.3.1.

### Creating client test networks

For example, to run `go` and `nim` against each other, you first need to bring up their VMs.

    vagrant up go --provision
    vagrant up nim --provision

Now run the Go client and copy its ENR from the output:

    vagrant ssh go -- bin/run.sh

Then run the Nim client, making it connect to the Go client:

    vagrant ssh nim -- bin/run.sh --bootnode:<go-ENR>

### Running the test suite

The `go` client has an additional script for running the black-box test suite.

    vagrant ssh go -- bin/test.sh <ENR>

You can also use this against a client implementation running on the host, just make sure
to set your listening address to 192.168.3.1.
