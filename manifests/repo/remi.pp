# = Class: yum::repo::remi
#
# This class installs the remi repo
#
class yum::repo::remi {
  yum::managed_yumrepo { 'remi':
    descr      => 'Remi\'s RPM repository for Enterprise Linux $releasever - $basearch',
    mirrorlist => 'http://rpms.remirepo.net/enterprise/$releasever/remi/mirror',
    enabled    => 1,
    gpgcheck   => 1,
    gpgkey     => 'http://rpms.remirepo.net/RPM-GPG-KEY-remi',
    priority   => 1
  }
}
