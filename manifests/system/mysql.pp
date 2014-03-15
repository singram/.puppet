package { "mysql":
    provider => dpkg,
    ensure   => installed,
#    source => "http://dev.mysql.com/get/Downloads/MySQL-5.6/mysql-5.6.16-debian6.0-x86_64.deb"
    source => "http://downloads.mysql.com/archives/get/file/mysql-5.6.14-debian6.0-x86_64.deb"
}
