# = Class: yum::repo::remi
#
# This class installs the remi repo
#
class yum::repo::remi {
  $releasever = $::operatingsystem ? {
    /(?i:Amazon)/ => '6',
    default       => '$releasever',  # Yum var
  }

  $os = $::operatingsystem ? {
    /(?i:Fedora)/ => 'fedora',
    default       => 'enterprise',
  }

  $osname = $::operatingsystem ? {
    /(?i:Fedora)/ => 'Fedora',
    default       => 'Enterprise Linux',
  }

  yum::managed_yumrepo { 'remi':
    descr      => "Remi's RPM repository for ${osname} \$releasever - \$basearch",
    mirrorlist => "http://rpms.remirepo.net/${os}/${releasever}/remi/mirror",
    enabled    => 1,
    gpgcheck   => 1,
    gpgkey     => 'http://rpms.remirepo.net/RPM-GPG-KEY-remi',
    priority   => 1,
  }
}
