Vagrant.configure(2) do |config|
    config.vm.hostname = "raspberries"
    config.vm.box = "ubuntu/vivid64"

    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.synced_folder ".", "/home/vagrant/workspace"

    config.vm.provider "virtualbox" do |virtualbox|
        virtualbox.linked_clone = true if Vagrant::VERSION =~ /^1.8/
    end
end
