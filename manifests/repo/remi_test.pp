# = Class: yum::repo::remi_test
#
# This class installs the remi test repo
#
class yum::repo::remi_test {
  yum::managed_yumrepo { 'remi-test':
    descr      => 'Remi\'s test RPM repository for Enterprise Linux $releasever - $basearch',
    mirrorlist => 'http://rpms.remirepo.net/enterprise/$releasever/test/mirror',
    enabled    => 1,
    gpgcheck   => 1,
    gpgkey     => 'http://rpms.remirepo.net/RPM-GPG-KEY-remi',
    priority   => 1
  }
}
