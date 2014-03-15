$mainUser = "singram"

file { "/home/$id":
    ensure   => "directory",
}

file { "/home/$id/packages":
    ensure   => "directory",
    require  => File["/home/$id"]
}

import 'system/sources.pp'

import 'system/hosts.pp'

import 'system/system_packages.pp'
import 'system/rabbitmq.pp'
import 'system/mongo.pp'
import 'system/redis.pp'
import 'system/mysql.pp'
import 'system/emacs_24_3.pp'
import 'system/rvm.pp'
