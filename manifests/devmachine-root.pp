$mainUser = "singram"

$desiredPackages = [
  'ack-grep',
  'ant',
  'build-essential',
  'cssh',
  'dconf-tools',
  'eclipse',
  'eclipse-jdt',
  'expect',
  'filezilla',
  'gedit-plugins',
  'git',
  'git-core',
  'gitg',
  'gnome-do',
  'htop',
  'libjpeg62',
  'libncursesw5-dev',
  'libreadline5-dev',
  'libssl-dev',
  'libxml2-dev',
  'libxslt1-dev',
  'maven',
  'meld',
  'msttcorefonts',
  'ncurses-term',
  'ntp',
  'openjdk-6-jdk',
  'rar',
  'screen',
  'sshfs',
  'subversion',
  'subversion-tools',
  'terminator',
  'tmux',
  'ubuntu-restricted-extras',
  'unrar',
  'unzip',
  'xclip',
  'zlib1g-dev',
]

$undesiredPackages = ['avahi-daemon']

package { $desiredPackages:
  ensure => installed
}

package { $undesiredPackages:
  ensure => purged
}
