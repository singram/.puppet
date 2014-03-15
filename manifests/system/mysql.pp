file { "/home/$id":
  ensure => "directory",
}

file { "/home/$id/packages":
  ensure => "directory",
  require => File["/home/$id"]
}

wget::fetch { "mysql_package_download":
#    source => "http://dev.mysql.com/get/Downloads/MySQL-5.6/mysql-5.6.16-debian6.0-x86_64.deb"
    source => "http://downloads.mysql.com/archives/get/file/mysql-5.6.14-debian6.0-x86_64.deb",
    destination => "/home/$id/packages/mysql-5.6.14-debian6.0-x86_64.deb",
    timeout     => 0,
    verbose     => false,
    require     => File["/home/$id/packages"]
}

package { "mysql":
    provider => dpkg,
    ensure   => installed,
    source => "puppet:///packages/mysql-5.6.14-debian6.0-x86_64.deb",
    require => Wget::Fetch["mysql_package_download"]
}
