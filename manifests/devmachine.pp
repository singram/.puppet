import 'development/rvm.pp'
import 'development/projects.pp'
import 'development/dotfiles.pp'

include clusterssh_config

stage {
  'rvm':      before => Stage['dotfiles'];
  'dotfiles': before => Stage['projects'];
  'projects': ;
}

class {
  rvm:      stage => 'rvm';
  dotfiles: stage => 'dotfiles';
  projects: stage => 'projects';
}
