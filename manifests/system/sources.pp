include apt

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

exec { "mongodb_key":
    command => "/usr/bin/apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10",
    unless => "/usr/bin/apt-key list| /bin/grep -c 10gen",
    before => Apt::Source['mongodb_source'],
}
