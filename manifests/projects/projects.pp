class project_repos {

  $personal_dir = "/home/$id/personal"

  file { "/home/$id/personal":
    ensure => "directory",
  }

  define personal_repo {

    exec { "clone_${title}_repo":
        path    => '/usr/bin/:/bin/',
        command => "git clone https://github.com/singram/${title}.git /${project_repos::personal_dir}/${title}",
        creates => "/${project_repos::personal_dir}/${title}",
        require => File[$project_repos::personal_dir]
    }

  }

  $repos = [
            'boggle',
            'cucumber_characteristics',
            'cucumber_rake_runner',
            'deployment_tracker',
            'euler',
            'mongo-docker-compose',
            'ner_service_example',
            'presentations',
            'roguelike_ruby',
            'sentiment',
            'solution_searching',
            'twitteranalyser'
            ]

  personal_repo { $repos: }

}
