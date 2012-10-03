# = Class: yum::repo::rbel
#
# This class installs the rbel repo
#
class yum::repo::rbel {

  yum::managed_yumrepo { 'rbel':
    descr => 'RBEL Repo',
    baseurl => $yum::osver[0] ? {
      5 => "http://rbel.frameos.org/stable/el5/$architecture",
      6 => "http://rbel.frameos.org/stable/el6/$architecture",
    },
    enabled        => 1,
    gpgcheck       => 0,
    failovermethod => 'priority',
    gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-RBEL' ,
    priority       => 16,
  }

}

