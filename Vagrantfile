# See <https://docs.vagrantup.com/v2/networking/public_network.html>
NETWORK_INTERFACES = [
    "en3: Thunderbolt Ethernet",
    "Killer e2200 PCI-E Gigabit Ethernet Controller (NDIS 6.20)",
]

def interface_name(interface)
    interface.split("\n").each do |line|
        if line =~ /^Name:\s+(.+?)$/
            return $1.to_s
        end
    end
    nil
end

def read_available_bridged_interfaces
    if Vagrant::Util::Platform.windows?
        available_interfaces = %x("C:/Program Files/Oracle/VirtualBox/VBoxManage.exe" list bridgedifs)
    else
        available_interfaces = %x(VBoxManage list bridgedifs)
    end
    available_interfaces.split("\n\n").map { |i| interface_name i }
end

def network_interfaces_available?
    (read_available_bridged_interfaces & NETWORK_INTERFACES).any?
end

def network(config)
    if network_interfaces_available?
        config.vm.network "public_network", bridge: NETWORK_INTERFACES
    else
        config.vm.network "private_network", type: "dhcp"
    end
end

Vagrant.configure(2) do |config|
    config.vm.hostname = "raspberries"
    config.vm.box = "ubuntu/vivid64"

    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.synced_folder ".", "/home/vagrant/workspace"

    network config

    config.vm.provision "shell", inline: %(
        apt-get update
        apt-get -y dist-upgrade
        apt-get -y install linux-image-extra-$(uname -r)
        apt-get -y install qemu-user-static zip

        curl -sO 'https://apt.dockerproject.org/repo/pool/main/d/docker-engine/docker-engine_1.9.1-0~vivid_amd64.deb'
        dpkg -i docker-engine_1.9.1-0~vivid_amd64.deb && rm docker-engine_1.9.1-0~vivid_amd64.deb
    )

    config.vm.provision "shell", privileged: false, inline: %(
        sudo usermod -aG docker $(whoami)
    )
end
