# = Class: yum::repo::remi_php70
#
# This class installs the remi-php70 repo
#
class yum::repo::remi_php70 {
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

  yum::managed_yumrepo { 'remi-php70':
    descr      => "Remi's PHP 7.0 RPM repository for ${osname} \$releasever - \$basearch",
    mirrorlist => "http://rpms.remirepo.net/${os}/${releasever}/php70/mirror",
    enabled    => 1,
    gpgcheck   => 1,
    gpgkey     => 'http://rpms.remirepo.net/RPM-GPG-KEY-remi',
    priority   => 1,
  }
}
