class yum::prerequisites {

  require yum

  yum::plugin { 'priorities': }
  yum::plugin { 'security': }

  if $yum::bool_install_all_keys == true {
    file { 'rpm_gpg':
      path   => '/etc/pki/rpm-gpg/',
      source => "puppet:///modules/yum/${operatingsystem}.${yum::osver[0]}/rpm-gpg/",
      recurse => true,
  #    purge   => $yum::bool_clean_repos ? {
  #      true  => true,
  #      false => false,
  #    },
      ignore  => '.svn',
      mode    => 0644,
      owner   => root,
      group   => 0,
    }
  }
}
