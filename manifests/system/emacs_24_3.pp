$emacsPackages = [
  'libjpeg-dev',
  'libpng-dev',
  'libgif-dev',
  'libtiff-dev',
  'libxpm-dev',
  'texinfo',
  'libncurses-dev'
]

package { $emacsPackages:
  ensure => installed,
  before => Exec['emacs_installation'],
}

exec { "emacs_installation":
    path    => "/usr/bin/:/bin/",
    cwd     => "/tmp",
    command => "wget ftp://ftp.gnu.org/gnu/emacs/emacs-24.3.tar.gz && tar xvfz emacs-24.3.tar.gz && cd emacs-24.3 && ./configure && make && make install",
    require => Package[$emacsPackages],
    unless  => "which emacs"
}
