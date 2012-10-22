# = Class: yum::repo::puppetlabs
#
# This class installs the puppetlabs repo
#
class yum::repo::puppetlabs {

  require common

  yum::managed_yumrepo { puppetlabs:
    descr => 'Puppet Labs Packages',
    baseurl => "http://yum.puppetlabs.com/el/$common::osver/products/\$basearch",
    enabled => 1,
    gpgcheck => 1,
    failovermethod => 'priority',
    gpgkey => 'http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs',
    priority => 15,
  }

  yum::managed_yumrepo { puppetlabs_dependencies:
    descr => 'Puppet Labs Packages',
    baseurl => "http://yum.puppetlabs.com/el/$common::osver/dependencies/\$basearch",
    enabled => 1,
    gpgcheck => 1,
    failovermethod => 'priority',
    gpgkey => 'http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs',
    priority => 15,
  }

}
