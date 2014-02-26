file { "/home/$id/projects":
  ensure => "directory",
}

exec { "clone_cdris_repo":
    path    => "/usr/bin/:/bin/",
    command => "git clone gitolite@10.118.180.214:cdris_repo /home/$id/projects/cdris_repo",
    creates => "/home/$id/projects/cdris_repo",
}

exec { "clone_cdris_puppet":
    path    => "/usr/bin/:/bin/",
    command => "git clone gitolite@10.118.180.214:cdris_puppet /home/$id/projects/cdris_puppet",
    creates => "/home/$id/projects/cdris_puppet",
}

exec { "clone_cdris_patient_identity":
    path    => "/usr/bin/:/bin/",
    command => "git clone gitolite@10.118.180.214:cdris_patient_identity /home/$id/projects/cdris_patient_identity",
    creates => "/home/$id/projects/cdris_patient_identity",
}

exec { "clone_cdris_test_ui":
    path    => "/usr/bin/:/bin/",
    command => "git clone gitolite@10.118.180.214:cdris_test_ui /home/$id/projects/cdris_test_ui",
    creates => "/home/$id/projects/cdris_test_ui",
}

exec { "clone_cdris_mirth":
    path    => "/usr/bin/:/bin/",
    command => "git clone gitolite@10.118.180.214:cdris_mirth /home/$id/projects/cdris_mirth",
    creates => "/home/$id/projects/cdris_mirth",
}

exec { "clone_cdris_idn":
    path    => "/usr/bin/:/bin/",
    command => "git clone gitolite@10.118.180.214:cdris_idn /home/$id/projects/cdris_idn",
    creates => "/home/$id/projects/cdris_idn",
}

exec { "clone_cdris_idn_puppet":
    path    => "/usr/bin/:/bin/",
    command => "git clone gitolite@10.118.180.214:cdris_idn_puppet /home/$id/projects/cdris_idn_puppet",
    creates => "/home/$id/projects/cdris_idn_puppet",
}

exec { "clone_cdris_dcs":
    path    => "/usr/bin/:/bin/",
    command => "git clone gitolite@10.118.180.214:cdris_dcs /home/$id/projects/cdris_dcs",
    creates => "/home/$id/projects/cdris_dcs",
}

exec { "clone_hcc_portal":
    path    => "/usr/bin/:/bin/",
    command => "git clone gitolite@10.118.180.214:hcc_portal /home/$id/projects/hcc_portal",
    creates => "/home/$id/projects/hcc_portal",
}

exec { "clone_hcc_portal_puppet":
    path    => "/usr/bin/:/bin/",
    command => "git clone gitolite@10.118.180.214:hcc_portal_puppet /home/$id/projects/hcc_portal_puppet",
    creates => "/home/$id/projects/hcc_portal_puppet",
}

exec { "clone_gitolite-admin ":
    path    => "/usr/bin/:/bin/",
    command => "git clone gitolite@10.118.180.214:gitolite-admin  /home/$id/projects/gitolite-admin",
    creates => "/home/$id/projects/gitolite-admin",
}
