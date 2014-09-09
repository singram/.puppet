class mysql {
  exec { "mysql_package_download":
      cwd      => "/root/packages/",
      command  => "wget http://downloads.mysql.com/archives/get/file/mysql-5.6.14-debian6.0-x86_64.deb",
      require  => File["/root/packages"],
      creates  => "/root/packages/mysql-5.6.14-debian6.0-x86_64.deb",
  }

  package { "mysql":
      provider => dpkg,
      ensure   => installed,
      source   => "/root/packages/mysql-5.6.14-debian6.0-x86_64.deb",
      require  => Exec['mysql_package_download']
  }

  group { "mysql":
          ensure => present,
  }

  user { "mysql":
          ensure => present,
          gid => "mysql",
          membership => minimum,
          shell => "/bin/bash",
          require => Group["mysql"]
  }

  file {'/tmp/mysql_installation.sh':
    ensure => present,
    content => template('mysql/mysql_installation.sh.erb'),
    mode => 777,
  }

  file {'/etc/my.cnf':
    ensure => present,
    content => template('mysql/my.cnf.erb'),
  }

  exec {'mysql_install_setup':
    command => '/tmp/mysql_installation.sh',
    require => [File['/tmp/mysql_installation.sh'], File['/etc/my.cnf'], User['mysql'], Group['mysql'], Package['mysql']],
    unless  => "which mysql && mysql --version | grep 5.6.14"
  }

  exec {'post_mysql_install_setup':
    command => '/opt/mysql/server-5.6/scripts/mysql_install_db --user=mysql --datadir=/var/lib/mysql',
    require => Exec['mysql_install_setup'],
    unless  => "[ -f /var/lib/mysql/mysql/user.MYI ]" 
  } 

  service { "mysql" :
    name => 'mysql',
    ensure => running,
    require => Exec['post_mysql_install_setup'],
    subscribe => File['/etc/my.cnf'],
  }

}
