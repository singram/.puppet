class system_packages {
  file { "/root/packages":
      ensure   => "directory",
  }

  $desiredPackages = [
    'ant',
    'bison',
    'clusterssh',
    'curl',
    'dconf-tools',
    'dstat',
    'eclipse',
    'eclipse-jdt',
    'erlang-nox',
    'expect',
    'git',
    'git-core',
    'gitg',
    'gnome-do',
    'htop',
    'iftop',
    'jnettop',
    'libaio1',
    'libffi-dev',
    'libgdbm-dev',
    'libgtk-3-dev',
    'libgtk2.0-dev',
    'libjpeg62',
    'libreadline6-dev',
    'libsqlite3-dev',
    'libssl-dev',
    'libxml2-dev',
    'libxslt1-dev',
    'libyaml-dev',
    'maven',
    'meld',
    'ncurses-term',
    'nmap',
    'ntp',
    'openjdk-6-jdk',
    'python',
    'python-pip',
    'rar',
    'screen',
    'sqlite3',
    'sshfs',
    'subversion',
    'subversion-tools',
    'sysstat',
    'terminator',
    'tmux',
    'unrar',
    'unzip',
    'xclip',
    'zlib1g-dev',
  #  'ack-grep',
  #  'build-essential',
  #  'gedit',
  #  'gedit-plugins',
  #  'msttcorefonts',
  #  'ubuntu-restricted-extras',
  #  'golang',
  #  'jmeter',
  ]

  package { $desiredPackages:
    ensure => installed
  }

  file { '/usr/lib/jvm/java-6-openjdk':
    ensure => 'link',
    target => '/usr/lib/jvm/java-6-openjdk-amd64',
    require => Package[ $desiredPackages ],
  }

  $undesiredPackages = ['avahi-daemon']

  package { $undesiredPackages:
    ensure => purged
  }
}
