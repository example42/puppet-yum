class yum::prerequisites {

  require yum

  package { "yum-priorities":
    name => $yum::packagename_yumpriority ,
    ensure => present,
  }

  # Purge /etc/yum.repos.d contents if yum_clean_repos is true
  file { 'yum_repos_d':
    path  => '/etc/yum.repos.d/',
    source  => "puppet:///modules/yum/empty",
    ensure  => directory,
    recurse => true,
    purge   => $yum::bool_clean_repos ? {
      true  => true,
      false => false,
    },
    force   => true,
    ignore  => '.svn',
    mode    => 0755,
    owner   => root,
    group   => 0,
  }

  #gpg key
  file { 'rpm_gpg':
    path   => '/etc/pki/rpm-gpg/',
    source => "puppet:///modules/yum/${operatingsystem}.${yum::osver[0]}/rpm-gpg/",
    recurse => true,
#    purge   => $yum::bool_clean_repos ? {
#      true  => true,
#      false => false,
#    },
    ignore  => '.svn',
    mode    => 0600,
    owner   => root,
    group   => 0,
  }
}
