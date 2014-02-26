include apt
include wget

apt::source { "puppetlabs":
            location        => "http://apt.puppetlabs.com/",
            release         => "precise",
            repos           => "main dependencies",
            include_src     => false
}

apt::source { "rabbitmq_debian":
            location        => "http://www.rabbitmq.com/debian/",
            release         => "testing",
            repos           => "main",
            include_src     => false
}

apt::source { "mongodb":
            location        => "http://downloads-distro.mongodb.org/repo/ubuntu-upstart",
            release         => "dist",
            repos           => "10gen",
            include_src     => false
}

apt::key { "rabbitmq":
    ensure => present,
    key_source => 'http://www.rabbitmq.com/rabbitmq-signing-key-public.asc',
}

apt::key { "mongo":
    key => '7F0CEB10',
    ensure => present,
    key_source => 'hkp://keyserver.ubuntu.com:80',
}
