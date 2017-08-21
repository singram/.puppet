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
     puppet apply --modulepath=$HOME/.puppet/modules ~/.puppet/manifests/projects.pp
cd ~/dotfiles
rake install
```

## Manual Installations

### Eclipse

Use the eclipse installer here
https://www.eclipse.org/downloads/download.php?file=/oomph/epp/oxygen/R/eclipse-inst-linux64.tar.gz

#### Lomboc
```
curl -L https://projectlombok.org/downloads/lombok.jar -o ~/Downloads/lombok.jar
java -jar ~/Downloads/lombok.jar
```

### Docker
```
sudo apt-get remove docker docker-engine docker.io
sudo apt-get purge lxc-docker

sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo echo deb https://apt.dockerproject.org/repo ubuntu-xenial main >> /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
sudo apt-get install linux-image-extra-$(uname -r)  linux-image-extra-virtual -y
sudo apt-get install docker-ce cgroup-lite apparmor -y
sudo usermod -a -G docker $USER
sudo service docker start
```
#### Docker-compose
```
sudo curl -L https://github.com/docker/compose/releases/download/1.15.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```
