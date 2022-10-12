# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    # ssh
    config.ssh.forward_agent = true
    config.ssh.username = "vagrant"
    config.ssh.password = "vagrant"

    # Network Settings
    config.vm.network "private_network", ip: "192.168.33.11"

    # Sync folders
    config.vm.synced_folder "E:/www", "/var/www/"
    config.vm.synced_folder "E:/hmds_box/hosts", "/etc/nginx/sites-available/"

    # Hmds box settings
    config.vm.define "hmds" do |hmds|
        # Box info
        hmds.vm.box = "hmds.box"
        hmds.vm.box_url = "hmdsvbox.box"

        # Provisions
        # hmds.vm.provision "shell", path: "./provisions/install.sh"
        hmds.vm.provision "vhosts", type: "shell", path: "./provisions/vhosts.sh", run: "always"
        hmds.vm.provision "db_setup", type: "shell", path: "./provisions/mysql.sh"

        # Provider Settings
        config.vm.provider "virtualbox" do |vb|
            vb.name = "hmds-box"
            vb.memory = 2048
            vb.cpus = 4
        end
    end
end
