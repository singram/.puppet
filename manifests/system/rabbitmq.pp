class rabbitmq {

  exec { 'rabbitmq_server_package_download':
      cwd      => '/root/packages/',
      command  => 'wget http://www.rabbitmq.com/releases/rabbitmq-server/v3.3.4/rabbitmq-server_3.3.4-1_all.deb',
      creates  => '/root/packages/rabbitmq-server_3.3.4-1_all.deb',
      require  => File['/root/packages'],
      before   => Package['rabbitmq-server'],
      notify   => Package['rabbitmq-server'],
      # Poor mans dpkg versioning
      # unless  => '[ -d /usr/lib/rabbitmq/lib/rabbitmq_server-3.3.4 ]'
  }

  package { 'rabbitmq-server':
      provider  => dpkg,
      ensure    => installed,
      source    => '/root/packages/rabbitmq-server_3.3.4-1_all.deb',
      subscribe => Exec['rabbitmq_server_package_download']
  }

  exec { 'rabbitmqadmin_installation':
      command   => 'wget http://hg.rabbitmq.com/rabbitmq-management/raw-file/rabbitmq_v3_3_4/bin/rabbitmqadmin -P /usr/bin/ && chmod +x /usr/bin/rabbitmqadmin',
      creates   => '/usr/bin/rabbitmqadmin',
      require   => Package['rabbitmq-server'],
      subscribe => Package['rabbitmq-server']
  }

  exec { 'rabbitmq_plugin_installation':
      environment => ['HOME=/root'],
      command     => 'rabbitmq-plugins enable rabbitmq_management rabbitmq_shovel rabbitmq_shovel_management',
      require     => Package['rabbitmq-server'],
      subscribe   => Package['rabbitmq-server'],
      unless      => '/usr/sbin/rabbitmq-plugins list -E -m | grep rabbitmq_management',
  }

  exec { 'rabbitmqadmin_bash_completion':
      command   => "sh -c 'rabbitmqadmin --bash-completion > /etc/bash_completion.d/rabbitmqadmin'",
      creates   => '/etc/bash_completion.d/rabbitmqadmin',
      require   => Exec['rabbitmqadmin_installation'],
      subscribe => Exec['rabbitmqadmin_installation']
  }

  service { 'rabbitmq' :
      restart   => '/etc/init.d/rabbitmq-server restart',
      name      => 'rabbitmq-server',
      ensure    => running,
      require   => Exec['rabbitmqadmin_bash_completion'],
      subscribe => Exec['rabbitmqadmin_bash_completion'],
  }

}
