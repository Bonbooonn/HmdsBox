# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    # ssh
    config.ssh.username = "vagrant"  
    config.ssh.password = "vagrant"  
    config.ssh.insert_key = false 

    # Network Settings
    config.vm.network "private_network", ip: "192.168.33.11"

    # Sync folders
    # Change sync folders according to your own setup
    config.vm.synced_folder "E:/www", "/var/www/"
    config.vm.synced_folder "./hosts", "/etc/nginx/sites-available/"
    config.vm.synced_folder "./ssl", "/etc/nginx/ssl/"

    # Hmds box settings
    config.vm.define "hmds" do |hmds|
        # Box info
        hmds.vm.box = "hmds.box"
        hmds.vm.box_url = "hmdsbox.box"

        # Provisions
        # hmds.vm.provision "shell", path: "./provisions/install.sh"

        # Unlink default nginx conf
        hmds.vm.provision "shell", inline: "unlink /etc/nginx/sites-enabled/default"
        hmds.vm.provision "shell", inline: "cp /var/www/hmds_api/.env.example /var/www/hmds_api/.env"
        hmds.vm.provision "vhosts", type: "shell", path: "./provisions/vhosts.sh", run: "always"
        hmds.vm.provision "status", type: "shell", path: "./provisions/status.sh", run: "always"

        # Manual Provisions
        hmds.vm.provision "composer_run", type: "shell", path: "./provisions/composer_run.sh", run: "never"
        hmds.vm.provision "laravel_key_generate", type: "shell", path: "./provisions/laravel_key_generate.sh", run: "never"
        hmds.vm.provision "db_setup", type: "shell", path: "./provisions/mysql.sh", run: "never"

        # Provider Settings
        config.vm.provider "virtualbox" do |vb|
            vb.name = "hmds-box"
            vb.memory = 2048
            vb.cpus = 4
        end
    end
end
