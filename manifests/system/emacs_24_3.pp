class emacs {

  $emacsPackages = [
    'libjpeg-dev',
    'libpng12-dev',
    'libgif-dev',
    'libtiff5-dev',
    'libxpm-dev',
    'texinfo',
    'libncurses5-dev'
  ]

  package { $emacsPackages:
    ensure => installed,
    before => Exec['emacs_installation'],
  }

  exec { "emacs_installation":
      cwd     => "/tmp",
      command => "wget ftp://ftp.gnu.org/gnu/emacs/emacs-24.3.tar.gz && tar xvfz emacs-24.3.tar.gz && cd emacs-24.3 && ./configure && make && make install",
      require => Package[$emacsPackages],
      creates  =>  "/usr/local/bin/emacs",
  }

}
