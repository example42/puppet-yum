# = Class: yum::repo::puppetlabs
#
# This class installs the puppetlabs repo
#
class yum::repo::puppetlabs {

  yum::managed_yumrepo { puppetlabs:
    descr => 'Puppet Labs Packages',
    baseurl => "http://yum.puppetlabs.com/el/${yum::osver[0]}/products/\$basearch",
    enabled => 1,
    gpgcheck => 1,
    failovermethod => 'priority',
    gpgkey => 'http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs',
    priority => 15,
  }

  # The dependencies repo has the same priority as base, because it needs to override
  # base packages. E.g. puppet-3.0 requires Ruby => 1.8.7, but EL5 ships with 1.8.5.
  #
  yum::managed_yumrepo { puppetlabs_dependencies:
    descr => 'Puppet Labs Packages',
    baseurl => "http://yum.puppetlabs.com/el/${yum::osver[0]}/dependencies/\$basearch",
    enabled => 1,
    gpgcheck => 1,
    failovermethod => 'priority',
    gpgkey => 'http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs',
    priority => 1, 
  }

}
