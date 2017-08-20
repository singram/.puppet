include apt

class sources {

  apt::key { 'puppetlabs_key':
             ensure     => present,
             key_source => 'http://apt.puppetlabs.com/pubkey.gpg',
             key        => '4BD6EC30',
             before     => Apt::Source['puppetlabs_source'],
  }

  apt::source { 'puppetlabs_source':
                location        => 'http://apt.puppetlabs.com/',
                release         => 'trusty',
                repos           => 'main dependencies',
                include_src     => false
  }

}
