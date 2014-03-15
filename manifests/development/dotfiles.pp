exec { "clone_dotfiles_repo":
    path    => "/usr/bin/:/bin/",
    command => "git clone https://github.com/singram/dotfiles.git /home/$id/projects/dotfiles",
    creates => "/home/$id/dotfiles",
}

exec { "dotfile_install":
    path    => "/usr/bin:/bin/",
    command => "rake install",
    cwd     => "/home/$id/dotfiles",
    require => Exec['clone_dotfiles_repo']
}
