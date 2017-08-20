class emacs251 {

  $emacsPackages = [
    'autoconf',
    'automake',
#    'build-dep',
    'libjpeg-dev',
    'libpng12-dev',
    'libgif-dev',
    'libncurses-dev',
    'libtiff-dev',
    'libxpm-dev',
    'libx11-dev',
    'texinfo',
    'libncurses5-dev'
  ]

  package { $emacsPackages:
    ensure => installed,
    before => Exec['emacs251_installation'],
  }

  exec { "emacs251_installation":
      cwd     => "/tmp",
      command => "wget ftp://ftp.gnu.org/gnu/emacs/emacs-25.1.tar.gz && tar xvfz emacs-25.1.tar.gz && cd emacs-25.1 && ./configure && make && make install",
      require => Package[$emacsPackages],
      creates  =>  "/usr/local/bin/emacs",
  }

}
