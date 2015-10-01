class rvm {

  exec { "rvm_installation":
     command     => "/usr/bin/curl -sSL https://get.rvm.io | bash -s stable",
     unless      => "/bin/which rvm",
     environment => ["HOME=/home/$id"]
  }

#  exec { "ruby_1_9_installation":
#     command => "/home/$id/.rvm/bin/rvm install ruby-1.9.3-p194 && /home/$id/.rvm/bin/rvm --default use 1.9.3-p194",
#     unless  => "/home/$id/.rvm/bin/rvm list | /bin/grep 1.9.3",
#     require => Exec['rvm_installation'],
#  }

}
