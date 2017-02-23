# = Class: yum::repo::sclo_sclo
#
# This class installs the Software Collections Repository (SCLo part)
#
class yum::repo::sclo_sclo (
  $baseurl = ''
) {

  $osver = split($::operatingsystemrelease, '[.]')
  $release = $::operatingsystem ? {
    /(?i:Centos|RedHat|Scientific)/ => $osver[0],
    default                         => '6',
  }

  $real_baseurl = $baseurl ? {
    ''      => "http://mirror.centos.org/centos/${release}/sclo/\$basearch/sclo/",
    default => $baseurl,
  }

  yum::managed_yumrepo { 'sclo-sclo':
    descr          => 'CentOS-$releasever - SCLo sclo',
    baseurl        => $real_baseurl,
    enabled        => 1,
    gpgcheck       => 0,
    priority       => 20,
    failovermethod => 'priority',
    gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-SIG-SCLo',
    gpgkey_source  => 'puppet:///modules/yum/rpm-gpg/RPM-GPG-KEY-CentOS-SIG-SCLo',
  }

}
