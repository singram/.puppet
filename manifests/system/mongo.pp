class mongo {

  $opensourcePkgs = ['mongodb-org-mongos', 'mongodb-org-server', 'mongodb-org-shell', 'mongodb-org-tools']
  $enterprisePkgs = ['mongodb-enterprise-mongos', 'mongodb-enterprise-server', 'mongodb-enterprise-shell', 'mongodb-enterprise-tools']
}

class mongo::opensource inherits mongo {
  package { $opensourcePkgs :
    ensure => '2.6.3',
    require => Package[$enterprisePkgs]
  }

  package { $enterprisePkgs :
    ensure => purged
  }

}

# Currently broken due to depenceny on libsnmp15 on 'Trusty'
# https://jira.mongodb.org/browse/SERVER-12344
class mongo::enterprise inherits mongo {
  package { $enterprisePkgs :
    ensure => '2.6.3',
    require => Package[$opensourcePkgs]
  }

  package { $opensourcePkgs :
    ensure => purged
  }

}
