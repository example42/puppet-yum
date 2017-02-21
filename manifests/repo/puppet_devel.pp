# = Class: yum::repo::puppetdevel
#
# This class installs the puppetdevel repo
#
## nota: due to rebranding, "PuppetLabs" is Now "Puppet"
##       and the GPG key is "RPM-GPG-KEY-puppet"
#
class yum::repo::puppet_devel (
  $baseurl_devel        = 'http://yum.puppetlabs.com/el/$releasever/devel/$basearch',
  $baseurl_dependencies = 'http://yum.puppetlabs.com/el/$releasever/dependencies/$basearch',
) {

  yum::managed_yumrepo { 'puppet_devel':
    descr          => 'Puppet Packages - Devel',
    baseurl        => $baseurl_devel,
    enabled        => 1,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppet',
    gpgkey_source  => 'puppet:///modules/yum/rpm-gpg/RPM-GPG-KEY-puppet',
    priority       => 15,
  }

  yum::managed_yumrepo { 'puppet_dependencies':
    descr          => 'Puppet Packages - Dependencies',
    baseurl        => $baseurl_dependencies,
    enabled        => 1,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppet',
    gpgkey_source  => 'puppet:///modules/yum/rpm-gpg/RPM-GPG-KEY-puppet',
    priority       => 15,
  }

}
