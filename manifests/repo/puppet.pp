# = Class: yum::repo::puppet
#
# This class installs the puppet repo
#
## nota: due to rebranding, "PuppetLabs" is Now "Puppet"
##       and the GPG key is "RPM-GPG-KEY-puppet"
#
class yum::repo::puppet (
  $baseurl_products     = '',
  $baseurl_dependencies = '',
) {
  $osver = $::operatingsystem ? {
    'XenServer' => [ '5' ],
    default     => split($::operatingsystemrelease, '[.]')
  }
  $release = $::operatingsystem ? {
    /(?i:Centos|RedHat|Scientific|CloudLinux|XenServer)/ => $osver[0],
    default                                              => '6',
  }

  $real_baseurl_products = $baseurl_products ? {
    ''      => "http://yum.puppetlabs.com/el/${release}/products/\$basearch",
    default => $baseurl_products,
  }

  $real_baseurl_dependencies = $baseurl_dependencies ? {
    ''      => "http://yum.puppetlabs.com/el/${release}/dependencies/\$basearch",
    default => $baseurl_dependencies,
  }

  yum::managed_yumrepo { 'puppet':
    descr          => 'Puppet Packages',
    baseurl        => $real_baseurl_products,
    enabled        => 1,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppet',
    gpgkey_source  => 'puppet:///modules/yum/rpm-gpg/RPM-GPG-KEY-puppet',
    priority       => 1,
  }

  # The dependencies repo has the same priority as base,
  # because it needs to override base packages.
  # E.g. puppet-3.0 requires Ruby => 1.8.7, but EL5 ships with 1.8.5.
  #
  yum::managed_yumrepo { 'puppet_dependencies':
    descr          => 'Puppet Packages',
    baseurl        => $real_baseurl_dependencies,
    enabled        => 1,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppet',
    gpgkey_source  => 'puppet:///modules/yum/rpm-gpg/RPM-GPG-KEY-puppet',
    priority       => 1,
  }

}
