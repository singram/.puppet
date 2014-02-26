package { "rabbitmq_server":
    ensure => "3.1.1-1",
#    source => "http://ftp.br.debian.org/debian/pool/main/r/rabbitmq-server/rabbitmq-server_3.1.1-1_all.deb"
    source => "http://www.rabbitmq.com/releases/rabbitmq-server/v3.1.1/rabbitmq-server_3.1.1-1_all.deb"
}

exec { "rabbitmqadmin_installation":
    path    => "/usr/bin/:/bin/",
    command => "wget http://hg.rabbitmq.com/rabbitmq-management/raw-file/rabbitmq_v3_1_1/bin/rabbitmqadmin -P /usr/bin/ && chmod +x /usr/bin/rabbitmqadmin",
    creates => "/usr/bin/rabbitmqadmin",
    require => Package["rabbitmq_server"]
}

exec { "rabbitmq_plugin_installation":
    path    => "/usr/bin/:/bin/",
    command => "rabbitmq-plugins enable rabbitmq_management rabbitmq_shovel rabbitmq_shovel_management && /etc/init.d/rabbitmq-server restart",
    require => Package["rabbitmq_server"]
}

exec { "rabbitmqadmin_bash_completion":
    path    => "/usr/bin/:/bin/",
    command => "sh -c 'rabbitmqadmin --bash-completion > /etc/bash_completion.d/rabbitmqadmin'",
    creates => "/etc/bash_completion.d/rabbitmqadmin",
    require => Exec["rabbitmqadmin_installation"]
}
