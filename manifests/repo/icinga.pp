# = Class: yum::repo::icinga
#
# This class installs the foreman repo
#
class yum::repo::icinga (
  $baseurl = 'http://packages.icinga.org/epel/$releasever/release/',
) {

  yum::managed_yumrepo { 'icinga':
    descr          => 'ICINGA (stable release for epel)',
    baseurl        => $baseurl,
    enabled        => 1,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => 'http://packages.icinga.org/icinga.key',
    priority       => 1,
  }
}
