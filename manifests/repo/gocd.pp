# = Class: yum::repo::gocd
#
# This class installs the GO CD repo installation
#
class yum::repo::gocd {
  yum::managed_yumrepo { 'gocd':
    descr          => 'CloudFlare Packages',
    baseurl        => 'https://download.go.cd',
    enabled        => 1,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => 'https://download.go.cd/GOCD-GPG-KEY.asc',
    priority       => 1,
  }
}
