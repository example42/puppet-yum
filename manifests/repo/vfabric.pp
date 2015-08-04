# = Class: yum::repo::vfabric
#
# This class installs the vfabric repo
#
class yum::repo::vfabric {

  $osver = split($::operatingsystemrelease, '[.]')

  yum::managed_yumrepo { 'vfabric':
    descr          => 'vFabric 5.3 Repo - $basesearch',
    baseurl        => "http://repo.vmware.com/pub/rhel${osver[0]}/vfabric/5.3/\$basearch",
    enabled        => 1,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => "http://repo.vmware.com/pub/rhel${osver[0]}/vfabric/5.3/RPM-GPG-KEY-VFABRIC-5.3-EL${osver[0]}",
    priority       => 1,
  }

}

