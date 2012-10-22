# = Class: yum::repo::remi
#
# This class installs the remi repo
#
class yum::repo::remi {
  yum::managed_yumrepo { 'remi':
    descr      => 'Les RPM de remi pour Enterpise Linux $releasever - $basearch',
    mirrorlist => 'http://rpms.famillecollet.com/enterprise/$releasever/remi/mirror',
    enabled    => 1,
    gpgcheck   => 1,
    gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
    priority   => 1,
  }
}
