class { 'rvm': version => '1.22.8' }

rvm::system_user { singram: }

if $rvm_installed == "true" {
  rvm_system_ruby {
    'ruby-1.9.2-p320':
      ensure      => 'present',
      default_use => true,
      build_opts  => ['--binary'];
    'jruby-1.7.4':
      ensure      => 'present',
      default_use => false;
  }
}
