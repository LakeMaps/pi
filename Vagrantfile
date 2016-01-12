Vagrant.configure(2) do |config|
    config.vm.hostname = "raspberries"
    config.vm.box = "ubuntu/vivid64"

    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.synced_folder ".", "/home/vagrant/workspace"

    config.vm.provision "shell", inline: %(
        apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
        echo "deb https://apt.dockerproject.org/repo ubuntu-vivid main" > /etc/apt/sources.list.d/docker.list

        apt-get update
        apt-get -y dist-upgrade
        apt-get -y install linux-image-extra-$(uname -r) docker-engine
        apt-get -y install qemu-user-static zip
    )

    config.vm.provision "shell", privileged: false, inline: %(
        sudo usermod -aG docker $(whoami)
    )

    config.vm.provider "virtualbox" do |virtualbox|
        virtualbox.linked_clone = true if Vagrant::VERSION =~ /^1.8/
    end
end
