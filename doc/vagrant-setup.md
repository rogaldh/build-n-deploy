# Vagrant setup

1. First of all we have to install VirtualBox & Vagrant on Windows.
2. Vagrant should be accessible via cli after setup (`$ vagrant`). Otherwise we have to add Vagrant\'s executable path to environment variables.
3. Copy `../Vagrantfile` to a home directory
4. `$ vagrant up --provider virtualbox`.
    Vagrant will download and mount chosen box to the VirtualBox. We use `ubuntu/trusty64`.
5. During installation process Vagrant should ask about network interface to use. It creates `rsa_key` also.
6. We use `rsa_key` which is located by path `HOME_DIR\.vagrant\machines\default\virtualbox\private_key`. Server is located at `vagrant@127.0.0.1:2222`. We can use [PuTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html) but we have to convert Vagrant\'s `private_key` to the PuTTY\'s format via PuTTYGen.

## Hints
`config.vm.synced_folder "src/", "/var/www", create: true` — allows to "inject" folder to vagrant

## Misc
* `$ vagrant global-status` — outputs all active Vagrant\'s boxes
* `$ vagrant reload BOX_ID` — reloads a box by `BOX_ID`

## Links
[ubuntu/trusty64](https://atlas.hashicorp.com/ubuntu/boxes/trusty64)
[Vagrant CLI](https://www.vagrantup.com/docs/cli/)
[Vagrant Synced Folders](https://www.vagrantup.com/docs/synced-folders/basic_usage.html)
