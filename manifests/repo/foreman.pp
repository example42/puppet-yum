# = Class: yum::repo::foreman
#
# This class installs the foreman repo
#
class yum::repo::foreman (
  $baseurl = 'http://yum.theforeman.org/stable/',
) {

  yum::managed_yumrepo { 'foreman':
    descr          => 'Foreman Repo',
    baseurl        => $baseurl,
    enabled        => 1,
    gpgcheck       => 0,
    failovermethod => 'priority',
    # gpgkey       => 'http://yum.theforeman.org/RPM-GPG-KEY-foreman',
    priority       => 1,
  }

}

