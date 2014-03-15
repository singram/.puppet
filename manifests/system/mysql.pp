exec { "mysql_package_download":
    path     => "/usr/bin/:/bin/",
    cwd      => "/home/$id/packages/",
    command  => "wget http://downloads.mysql.com/archives/get/file/mysql-5.6.14-debian6.0-x86_64.deb",
    require  => File["/home/$id/packages"],
    before   => Package["mysql_install"],
    creates  => "/home/$id/packages/mysql-5.6.14-debian6.0-x86_64.deb",
}

package { "mysql_install":
    provider => dpkg,
    ensure   => installed,
    source   => "/home/$id/packages/mysql-5.6.14-debian6.0-x86_64.deb",
}
