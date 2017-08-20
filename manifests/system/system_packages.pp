class system_packages {
  file { "/root/packages":
      ensure   => "directory",
  }

  $desiredPackages = [
    'ant',
    'bison',
    'build-essential',
    'checkinstall',
    'clusterssh',
    'curl',
    'dconf-tools',
    'dstat',
    'eclipse',
    'eclipse-jdt',
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
    'python',
    'python-pip',
    'rar',
    'screen',
    'sqlite3',
    'sshfs',
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

  $undesiredPackages = ['avahi-daemon']

  package { $undesiredPackages:
    ensure => purged
  }
}
