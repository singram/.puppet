include apt
include wget

apt::source { "puppetlabs_source":
            location        => "http://apt.puppetlabs.com/",
            release         => "precise",
            repos           => "main dependencies",
            include_src     => false
}

apt::source { "rabbitmq_debian_source":
            location        => "http://www.rabbitmq.com/debian/",
            release         => "testing",
            repos           => "main",
            include_src     => false
}

apt::source { "mongodb_source":
            location        => "http://downloads-distro.mongodb.org/repo/ubuntu-upstart",
            release         => "dist",
            repos           => "10gen",
            include_src     => false
}

apt::key { "rabbitmq_key":
    ensure => present,
    key_source => 'http://www.rabbitmq.com/rabbitmq-signing-key-public.asc',
    before => Apt::Source['rabbitmq_debian_source']
}

apt::key { "mongodb_key":
    key => '7F0CEB10',
    ensure => present,
    key_source => 'hkp://keyserver.ubuntu.com:80',
    before => Apt::Source['mongodb_source']
}
