include apt

class sources {

  apt::key { 'puppetlabs_key':
             ensure     => present,
             key_source => 'http://apt.puppetlabs.com/pubkey.gpg',
             key        => '4BD6EC30',
             before     => Apt::Source['puppetlabs_source'],
  }

  apt::key { 'elasticsearch_key':
             ensure     => present,
             key_source => 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch',
             key        => 'D88E42B4',
             before     => Apt::Source['elasticsearch_source']
  }

  apt::key { 'rabbitmq_key':
             ensure     => present,
             key_source => 'http://www.rabbitmq.com/rabbitmq-signing-key-public.asc',
             key        => '056E8E56',
             before     => Apt::Source['rabbitmq_debian_source']
  }

  exec { 'mongodb_key':
         command => '/usr/bin/apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10',
         unless  => '/usr/bin/apt-key list| /bin/grep -c 10gen',
         before  => Apt::Source['mongodb_source'],
  }

  apt::source { 'puppetlabs_source':
                location        => 'http://apt.puppetlabs.com/',
                release         => 'trusty',
                repos           => 'main dependencies',
                include_src     => false
  }

  apt::source { 'elasticsearch_source':
                location        => 'http://packages.elasticsearch.org/elasticsearch/1.3/debian',
                release         => 'stable',
                repos           => 'main',
                include_src     => false
  }

  apt::source { 'rabbitmq_debian_source':
                location        => 'http://www.rabbitmq.com/debian/',
                release         => 'testing',
                repos           => 'main',
                include_src     => false
  }

  apt::source { 'mongodb_source':
                location        => 'http://downloads-distro.mongodb.org/repo/ubuntu-upstart',
                release         => 'dist',
                repos           => '10gen',
                include_src     => false
  }

}
