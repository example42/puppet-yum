# = Class: yum::repo::remi
#
# This class installs the remi repo
#
class yum::repo::atomic {
  yum::managed_yumrepo { 'atomic':
    descr      => 'CentOS / Red Hat Enterprise Linux $releasever - atomicrocketturtle.com',
    mirrorlist => 'http://www.atomicorp.com/mirrorlist/atomic/centos-$releasever-$basearch',
    enabled    => 1,
    gpgcheck   => 1,
    gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY.art.txt',
    priority   => 1,
  }
}
