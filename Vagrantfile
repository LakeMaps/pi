Vagrant.configure(2) do |config|
    config.vm.box = "ubuntu/xenial64"
    config.vm.provision "shell", name: "Install tools",
        inline: "apt-get update && apt-get -y install qemu-user-static systemd-container zip"
end
