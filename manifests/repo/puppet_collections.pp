# = Class: yum::repo::puppet_collections
#
# This class installs the puppet-collections repo
#
## nota: due to rebranding, "PuppetLabs" is Now "Puppet"
##       and the GPG key is "RPM-GPG-KEY-puppet"
#
class yum::repo::puppet_collections (
  $baseurl    = '',
  $collection = '1',
  $priority   = 99,
) {
  $osver = $::operatingsystem ? {
    'XenServer' => [ '5' ],
    default     => split($::operatingsystemrelease, '[.]')
  }
  $release = $::operatingsystem ? {
    /(?i:Centos|RedHat|Scientific|CloudLinux|XenServer)/ => $osver[0],
    default                                              => '6',
  }

  $real_baseurl = $baseurl ? {
    ''      => "http://yum.puppetlabs.com/el/${release}/PC${collection}/\$basearch",
    default => $baseurl,
  }

  yum::managed_yumrepo { 'puppet':
    descr          => 'Puppet Collections',
    baseurl        => $real_baseurl,
    enabled        => 1,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppet',
    gpgkey_source  => 'puppet:///modules/yum/rpm-gpg/RPM-GPG-KEY-puppet',
    priority       => $priority,
  }

}
