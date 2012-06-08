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
    ensure  => running,
    enable  => true,
    require => Package['yum-updatesd'],
  }

  file { 'yum-updatesd.con'":
    path    => "/etc/yum/yum-updatesd.conf",
    ensure  => present,
    source  => 'puppet:///modules/yum/yum-updatesd.conf',
    require => Package['yum-updatesd'],
  }

}
