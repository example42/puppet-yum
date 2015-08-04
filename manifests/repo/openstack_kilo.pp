# = Class: yum::repo::openstack_kilo
#
# This class installs the EL-7 repo for OpenStack Kilo
#
class yum::repo::openstack_kilo {


  yum::managed_yumrepo { 'epel-openstack-kilo':
    descr          => 'OpenStack Kilo Repository for EPEL-7',
    baseurl        => 'https://repos.fedorapeople.org/repos/openstack/openstack-kilo/el7/',
    enabled        => 1,
    gpgcheck       => 0,
    failovermethod => 'priority',
    priority       => 1,
  }
}
