# = Class: yum::repo::sclo_rh
#
# This class installs the Software Collections Repository (RH part)
#
class yum::repo::sclo_rh (
  $baseurl = ''
) {

  $osver = split($::operatingsystemrelease, '[.]')
  $release = $::operatingsystem ? {
    /(?i:Centos|RedHat|Scientific)/ => $osver[0],
    default                         => '6',
  }

  $real_baseurl = $baseurl ? {
    ''      => "http://mirror.centos.org/centos/${release}/sclo/\$basearch/rh/",
    default => $baseurl,
  }

  yum::managed_yumrepo { 'sclo-rh':
    descr          => 'CentOS-$releasever - SCLo rh',
    baseurl        => $real_baseurl,
    enabled        => 1,
    gpgcheck       => 0,
    priority       => 20,
    failovermethod => 'priority',
    gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-SIG-SCLo',
    gpgkey_source  => 'puppet:///modules/yum/rpm-gpg/RPM-GPG-KEY-CentOS-SIG-SCLo',
  }

}
