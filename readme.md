# HMDS Local DEV Environment LEMP STACK

# Environment
PHP v8.1

Nginx

MySQL v8


## Install vagrant
### https://www.vagrantup.com/downloads

## Install Virtual box
### https://www.virtualbox.org/wiki/Downloads

## Run Vagrant box setup
Change config.vm.synced_folder according to your own workspace directory

Create/Change hosts files according to your own setup in the directory

Go to vagrant box directory

Open terminal

Type Vagrant up

## To run individual provisions
vagrant provision --provision-with provision_name

## Manual Provisions
### Only run this provision once, should be done with first installation
vagrant provision --provision-with laravel_key_generate

vagrant provision --provision-with composer_run

vagrant provision --provision-with db_setup
