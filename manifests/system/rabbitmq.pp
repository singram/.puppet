exec { "rabbitmq_server_package_download":
    path     => "/usr/bin/:/bin/",
    cwd      => "/root/packages/",
#    source => "http://ftp.br.debian.org/debian/pool/main/r/rabbitmq-server/rabbitmq-server_3.1.1-1_all.deb"
    command  => "wget http://www.rabbitmq.com/releases/rabbitmq-server/v3.1.1/rabbitmq-server_3.1.1-1_all.deb",
    require  => File["/root/packages"],
    before   => Package["rabbitmq_server_install"],
    creates  => "/root/packages/rabbitmq-server_3.1.1-1_all.deb",
}

package { "rabbitmq_server_install":
    provider => dpkg,
    ensure   => installed,
    source   => "/root/packages/rabbitmq-server_3.1.1-1_all.deb",
}

exec { "rabbitmqadmin_installation":
    path    => "/usr/bin/:/bin/:/usr/sbin/",
    command => "wget http://hg.rabbitmq.com/rabbitmq-management/raw-file/rabbitmq_v3_1_1/bin/rabbitmqadmin -P /usr/bin/ && chmod +x /usr/bin/rabbitmqadmin",
    creates => "/usr/bin/rabbitmqadmin",
    require => Package["rabbitmq_server_install"]
}

exec { "rabbitmq_plugin_installation":
    path    => "/usr/bin/:/bin/:/usr/sbin/",
    command => "rabbitmq-plugins enable rabbitmq_management rabbitmq_shovel rabbitmq_shovel_management",
    require => Package["rabbitmq_server_install"]
}

exec { "rabbitmqadmin_bash_completion":
    path    => "/usr/bin/:/bin/:/usr/sbin/",
    command => "sh -c 'rabbitmqadmin --bash-completion > /etc/bash_completion.d/rabbitmqadmin'",
    creates => "/etc/bash_completion.d/rabbitmqadmin",
    require => Exec["rabbitmqadmin_installation"]
}

service { "rabbitmq_server_restart" :
  restart => '/etc/init.d/rabbitmq-server restart',
  name => 'rabbitmq-server',
  ensure => running,
  require => Exec['rabbitmqadmin_bash_completion'],
}
