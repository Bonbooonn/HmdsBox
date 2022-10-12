# HMDS Local DEV Environment

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

## Manual Provision
### Only run this provision if you have not created the APP_KEY in the app
vagrant provision --provision-with manual_provisions
