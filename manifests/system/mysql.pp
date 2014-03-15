exec { "mysql_package_download":
    path     => "/usr/bin/:/bin/",
    cwd      => "/root/packages/",
    command  => "wget http://downloads.mysql.com/archives/get/file/mysql-5.6.14-debian6.0-x86_64.deb",
    require  => File["/root/packages"],
    before   => Package["mysql_install"],
    creates  => "/root/packages/mysql-5.6.14-debian6.0-x86_64.deb",
}

package { "mysql_install":
    provider => dpkg,
    ensure   => installed,
    source   => "/root/packages/mysql-5.6.14-debian6.0-x86_64.deb",
}
