class clusterssh_config {

  file { "/home/$id/.csshrc":
    owner => "$id",
    group => "$id",
    mode => 644,
    source => "puppet:///modules/clusterssh_config/clusterssh_config",
  }

}
