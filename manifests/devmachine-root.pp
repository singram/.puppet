$mainUser = "singram"

Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

import 'system/sources.pp'
import 'system/hosts.pp'
import 'system/system_packages.pp'
import 'system/emacs_25_1.pp'
import 'system/aws-cli.pp'

stage {
  'sources':         before => Stage['hosts'];
  'hosts':           before => Stage['system_packages'];
  'system_packages': before => Stage['applications'];
  'applications': ;
}

class {
  sources:            stage => 'sources';
  hosts:              stage => 'hosts';
  system_packages:    stage => 'system_packages';
  emacs251:           stage => 'applications';
  awscli:             stage => 'applications';
}
