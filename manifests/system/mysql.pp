exec { "mysql_package_download":
    path     => "/usr/bin/:/bin/",
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
  path    => "/usr/bin/:/bin/:/usr/sbin/",
  command => '/tmp/mysql_installation.sh',
  require => [File['/tmp/mysql_installation.sh'], File['/etc/my.cnf'], User['mysql'], Group['mysql'], Package['mysql']]
}

service { "mysql" :
  name => 'mysql',
  ensure => running,
  require => Exec['mysql_install_setup'],
}
