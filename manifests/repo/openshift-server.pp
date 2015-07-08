# = Class: yum::repo::openshift-server
#
# This class installs the openshift-server repo for CentOS6
#
class yum::repo::openshift-server ($version=4)
  yum::managed_yumrepo { 'openshift-origin':
    descr          => 'Openshift Origin',
    baseurl        => 'https://mirror.openshift.com/pub/origin-server/release/$version/rhel-6/packages/${::architecture}',
    enabled        => 1,
    gpgcheck       => 0,
    failovermethod => 'priority',
    priority       => 1,
    mirrorlist     => absent,
    require        => Package['yum-plugin-priorities'],
  }

  yum::managed_yumrepo { 'openshift-deps':
    descr          => 'Openshift Dependencies',
    baseurl        => 'https://mirror.openshift.com/pub/origin-server/release/4/rhel-6/dependencies/x86_64/',
    enabled        => 1,
    gpgcheck       => 0,
    failovermethod => 'priority',
    priority       => 1,
    mirrorlist     => absent,
    require        => Package['yum-plugin-priorities'],
  }
}
