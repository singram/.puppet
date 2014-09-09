class mongo {
  package { "mongodb-org":
    ensure => '2.6.3',
  }
}
