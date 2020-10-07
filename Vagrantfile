Vagrant.configure("2") do |config|
  config.vm.box = "generic/alpine312"

  config.vm.define "go" do |config|
    config.vm.hostname = "discv5-go.box"
    config.vm.provision "shell", path: "go/setup.sh", privileged: false
    config.vm.provision "file", source: "go/run.sh", destination: "$HOME/bin/run.sh"
    config.vm.provision "file", source: "go/test.sh", destination: "$HOME/bin/test.sh"
    config.vm.network :private_network, ip: "192.168.3.21", hostname: true
    # needs two IPs to run test suite
    config.vm.network :private_network, ip: "192.168.4.21", auto_config: false
    config.vm.provision "shell", run: "always", inline: "ifconfig eth2 192.168.4.21 netmask 255.255.255.0 up"
  end

  config.vm.define "nim" do |config|
    config.vm.hostname = "discv5-nim.box"
    config.vm.provision "shell", path: "nim/setup.sh", privileged: false
    config.vm.provision "file", source: "nim/run.sh", destination: "$HOME/bin/run.sh"
    config.vm.network :private_network, ip: "192.168.3.31"
    config.vm.provision "shell", run: "always", inline: "route add -net 192.168.4.0/24 eth1"
  end

  config.vm.define "python" do |config|
    config.vm.box = "generic/ubuntu2004" # build doesn't work on alpine
    config.vm.hostname = "discv5-python.box"
    config.vm.provision "shell", path: "python/setup.sh", privileged: false
    config.vm.provision "file", source: "python/run.sh", destination: "$HOME/bin/run.sh"
    config.vm.network :private_network, ip: "192.168.3.41", hostname: true
    config.vm.provision "shell", run: "always", inline: "route add -net 192.168.4.0/24 eth1"
  end

  config.vm.define "rust" do |config|
    config.vm.hostname = "discv5-rust.box"
    config.vm.provision "shell", path: "rust/setup.sh", privileged: false
    config.vm.network :private_network, ip: "192.168.3.51"
    config.vm.provision "shell", run: "always", inline: "route add -net 192.168.4.0/24 eth1"
  end

  config.vm.define "java" do |config|
    config.vm.box = "generic/ubuntu2004" # build doesn't work on alpine
    config.vm.hostname = "discv5-java.box"
    config.vm.provision "shell", path: "java/setup.sh", privileged: false
    config.vm.provision "file", source: "java/run.sh", destination: "$HOME/bin/run.sh"
    config.vm.network :private_network, ip: "192.168.3.61"
    config.vm.provision "shell", run: "always", inline: "route add -net 192.168.4.0/24 eth1"
  end
end
