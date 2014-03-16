class rabbitmq {

  exec { "rabbitmq_server_package_download":
      cwd      => "/root/packages/",
  #    source => "http://ftp.br.debian.org/debian/pool/main/r/rabbitmq-server/rabbitmq-server_3.1.1-1_all.deb"
      command  => "wget http://www.rabbitmq.com/releases/rabbitmq-server/v3.1.1/rabbitmq-server_3.1.1-1_all.deb",
      require  => File["/root/packages"],
      before   => Package["rabbitmq-server"],
      creates  => "/root/packages/rabbitmq-server_3.1.1-1_all.deb",
  }

  package { "rabbitmq-server":
      provider => dpkg,
      ensure   => present,
      source   => "/root/packages/rabbitmq-server_3.1.1-1_all.deb",
  #    unless  => "/usr/bin/dpkg -s rabbitmq-server",
  }

  exec { "rabbitmqadmin_installation":
      command => "wget http://hg.rabbitmq.com/rabbitmq-management/raw-file/rabbitmq_v3_1_1/bin/rabbitmqadmin -P /usr/bin/ && chmod +x /usr/bin/rabbitmqadmin",
      creates => "/usr/bin/rabbitmqadmin",
      require => Package["rabbitmq-server"]
  }

  exec { "rabbitmq_plugin_installation":
      environment => ["HOME=/root"],
      command => "rabbitmq-plugins enable rabbitmq_management rabbitmq_shovel rabbitmq_shovel_management",
      require => Package["rabbitmq-server"],
      unless  => "/usr/sbin/rabbitmq-plugins list -E -m | grep rabbitmq_management",
  }

  exec { "rabbitmqadmin_bash_completion":
      command => "sh -c 'rabbitmqadmin --bash-completion > /etc/bash_completion.d/rabbitmqadmin'",
      creates => "/etc/bash_completion.d/rabbitmqadmin",
      require => Exec["rabbitmqadmin_installation"]
  }

  service { "rabbitmq-server_restart" :
    restart => '/etc/init.d/rabbitmq-server restart',
    name => 'rabbitmq-server',
    ensure => running,
    require => Exec['rabbitmqadmin_bash_completion'],
  }
}
