package { "mongodb-10gen":
    ensure => '2.4.5',
    before => Apt::Key['mongodb_key']
}
