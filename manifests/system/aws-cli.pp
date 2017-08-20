class awscli {
  $awscliPackages = [
    'python-dev'
  ]

  package { $awscliPackages:
    ensure => installed,
    before => Exec['awscli_installation'],
  }
  
  exec { "awscli_installation":
      cwd     => "/tmp",
      command => "wget https://s3.amazonaws.com/aws-cli/awscli-bundle.zip && unzip awscli-bundle.zip && sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws",
      creates  =>  "/usr/local/bin/aws",
  }

}
