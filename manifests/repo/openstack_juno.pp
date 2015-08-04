# = Class: yum::repo::openstack_juno
#
# This class installs the EPEL-7 repo for OpenStack Juno
#
class yum::repo::openstack_juno {


  yum::managed_yumrepo { 'epel-openstack-juno':
    descr          => 'OpenStack Juno Repository for EPEL-7',
    baseurl        => 'https://repos.fedorapeople.org/repos/openstack/openstack-juno/epel-7/',
    enabled        => 1,
    gpgcheck       => 0,
    failovermethod => 'priority',
    priority       => 1,
  }
}
