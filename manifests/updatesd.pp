# Class yum::updatesd
#
# Installs and enables yum updatesd
# 
#
class yum::updatesd {

  require yum

  package { 'yum-updatesd':
    name   => 'yum-updatesd',
    ensure => present,
  }

  service { 'yum-updatesd':
    ensure     => $yum::manage_service_ensure,
    enable     => $yum::manage_service_enable,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['yum-updatesd'],
  }

  file { 'yum-updatesd.conf'":
    ensure  => $yum::manage_file,
    path    => "/etc/yum/yum-updatesd.conf",
    source  => 'puppet:///modules/yum/yum-updatesd.conf',
    require => Package['yum-updatesd'],
  }

}
