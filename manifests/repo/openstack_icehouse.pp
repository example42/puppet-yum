# = Class: yum::repo::openstack_icehouse
#
# This class installs the EPEL repo for OpenStack Icehouse
#
class yum::repo::openstack_icehouse {

$osver = split($::operatingsystemrelease, '[.]')
  case $osver[0] {
    '7': {
	$baseurl = 'http://repos.fedorapeople.org/repos/openstack/openstack-icehouse/epel-7'
	}
    '6': {
        $baseurl = 'http://repos.fedorapeople.org/repos/openstack/openstack-icehouse/epel-6'
        }
	default: { fail('Unsupported version of Enterprise Linux') }
  }


  yum::managed_yumrepo { 'epel-openstack-icehouse':
    descr          => 'OpenStack Icehouse Repository for EPEL $releasever',
    baseurl        => $baseurl,
    enabled        => 1,
    gpgcheck       => 0,
    failovermethod => 'priority',
    priority       => 1,
  }
}
