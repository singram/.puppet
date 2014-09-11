$mainUser = "singram"

Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

import 'system/sources.pp'
import 'system/hosts.pp'
import 'system/system_packages.pp'
import 'system/rabbitmq.pp'
import 'system/mongo.pp'
import 'system/redis.pp'
import 'system/mysql.pp'
import 'system/emacs_24_3.pp'

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
  emacs:              stage => 'applications';
  mongo::opensource:  stage => 'applications';
  rabbitmq:           stage => 'applications';
  redis26:            stage => 'applications';
  mysql:              stage => 'applications';
}
