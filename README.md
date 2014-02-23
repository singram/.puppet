# Stuart's puppet files
=======
This puppet configuration should allow me to reconstruct my entire development environment on a blank system

## How To Use
```
sudo apt-get update
sudo apt-get install puppet git
git clone https://github.com/singram/.puppet.git ~/.puppet
sudo puppet apply --modulepath=$HOME/.puppet/modules ~/.puppet/manifests/devmachine-root.pp
puppet apply --modulepath=$HOME/.puppet/modules ~/.puppet/manifests/devmachine.pp
```
