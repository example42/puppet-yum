# Class yum::updatesd
#
# Installs and enables yum updatesd
#
#
class yum::updatesd {

  require yum

  $manage_update_package = $yum::update_disable ? {
    'true'  => absent,
    default => present,
  }

  $manage_update_service_ensure = $yum::update_disable ? {
    'true'  => stopped,
    default => running,
  }

  $manage_update_service_enable = $yum::update_disable ? {
    'true'  => false,
    default => true,
  }

  $manage_update_file = $yum::update_disable ? {
    'true'  => absent,
    default => present,
  }

  package { 'yum-updatesd':
    ensure => $manage_update_package,
    name   => 'yum-updatesd',
  }

  service { 'yum-updatesd':
    ensure     => $manage_update_service_ensure,
    enable     => $manage_update_service_enable,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['yum-updatesd'],
  }

  file { 'yum-updatesd.conf':
    ensure  => $manage_update_file,
    path    => '/etc/yum/yum-updatesd.conf',
    source  => 'puppet:///modules/yum/yum-updatesd.conf',
    require => Package['yum-updatesd'],
  }

}
