$desiredPackages = [
#  'ack-grep',
#  'build-essential',
#  'ubuntu-restricted-extras',
#  'msttcorefonts',
  'ant',
  'clusterssh',
  'curl',
  'dconf-tools',
  'dstat',
  'eclipse',
  'eclipse-jdt',
  'erlang-nox',
  'expect',
#  'gedit',
#  'gedit-plugins',
  'git',
  'git-core',
  'gitg',
  'gnome-do',
  'htop',
  'iftop',
  'jnettop',
  'libaio1',
  'libgtk-3-dev',
  'libgtk2.0-dev',
  'libjpeg62',
  'libssl-dev',
  'libxml2-dev',
  'libxslt1-dev',
  'maven',
  'meld',
  'ncurses-term',
  'nmap',
  'ntp',
  'openjdk-6-jdk',
  'rar',
  'python',
  'screen',
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
]

package { $desiredPackages:
  ensure => installed
}

$undesiredPackages = ['avahi-daemon']

package { $undesiredPackages:
  ensure => purged
}
