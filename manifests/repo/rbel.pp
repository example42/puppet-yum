# = Class: yum::repo::rbel
#
# This class installs the rbel repo
#
class yum::repo::rbel {

  $osver = split($::operatingsystemrelease, '[.]')
  yum::managed_yumrepo { 'rbel':
    descr          => 'RBEL Repo',
    baseurl        => "http://rbel.frameos.org/stable/el${osver}[0]/${architecture}",
    enabled        => 1,
    gpgcheck       => 0,
    failovermethod => 'priority',
    gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-RBEL' ,
    priority       => 16,
  }

}

