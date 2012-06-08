# = Class yum::cron
#
#
class yum::cron {

  package { yum-cron:
    ensure => present
  }

  service { yum-cron:
    ensure     => $yum::manage_service_ensure,
    name       => $yum::service,
    enable     => $yum::manage_service_enable,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['yum-cron'],
  }

}
