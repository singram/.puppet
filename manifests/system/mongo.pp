package { "mongodb-10gen":
    ensure => '2.4.5',
    before => Exec['mongodb_key']
}
