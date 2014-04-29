# Stuart's puppet files
=======
This puppet configuration should allow me to reconstruct my entire development environment on a blank system

Ensure that if you are using Gnome you have changed the terminal preferences to login shell

Edit -> Profiles -> (select profile) Edit -> Title & Command -> Run command as login shell

## How To Use
```
sudo apt-get update
sudo apt-get install puppet git
sudo gem install rake
git clone https://github.com/singram/.puppet.git ~/.puppet
sudo puppet apply --modulepath=$HOME/.puppet/modules ~/.puppet/manifests/devmachine-root.pp
     puppet apply --modulepath=$HOME/.puppet/modules ~/.puppet/manifests/devmachine.pp
cd ~/dotfiles
rake install
```
