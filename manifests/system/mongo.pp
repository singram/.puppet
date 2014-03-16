class mongo {
  package { "mongodb-10gen":
    ensure => '2.4.5',
  }
}
