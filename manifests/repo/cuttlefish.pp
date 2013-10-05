# = Class: yum::repo::cuttlefish
#
# This class installs the cuttlefish repo
#
class yum::repo::cuttlefish {

  yum::managed_yumrepo { 'cuttlefish':
    descr          => 'Ceph cuttlefish repository',
    baseurl        => 'http://ceph.com/rpm-cuttlefish/$releasever/$basearch',
    enabled        => 1,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => 'https://ceph.com/git/?p=ceph.git;a=blob_plain;f=keys/release.asc',
    autokeyimport  => 'yes',
    priority       => 5,
  }

}

