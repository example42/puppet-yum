# = Class: yum::defaults
#
# This class manages default yum repositories for RedHat based distros:
# RHEL, Centos, Scientific Linux
#
class yum::defaults ( ) inherits yum::params {

  $osver = split($::operatingsystemrelease, '[.]')

  if 'epel' in $yum::extrarepo { contain yum::repo::epel }
  if 'rpmforge' in $yum::extrarepo { contain yum::repo::rpmforge }
  if 'jpackage5' in $yum::extrarepo { contain yum::repo::jpackage5 }
  if 'jpackage6' in $yum::extrarepo { contain yum::repo::jpackage6 }
  if 'remi' in $yum::extrarepo { contain yum::repo::remi }
  if 'remi_php55' in $yum::extrarepo { contain yum::repo::remi_php55 }
  if 'remi_php56' in $yum::extrarepo { contain yum::repo::remi_php56 }
  if 'remi_php70' in $yum::extrarepo { contain yum::repo::remi_php70 }
  if 'tmz' in $yum::extrarepo and $osver[0] != '4' { contain yum::repo::tmz }
  if 'webtatic' in $yum::extrarepo { contain yum::repo::webtatic }
  if 'puppetlabs' in $yum::extrarepo and $osver[0] != '4' { contain yum::repo::puppetlabs }
  if 'puppetdevel' in $yum::extrarepo and $osver[0] != '4' { contain yum::repo::puppetdevel }
  if 'puppetlabs_collections' in $yum::extrarepo { contain yum::repo::puppetlabs_collections }
  if 'nginx' in $yum::extrarepo and $osver[0] != '4' { contain yum::repo::nginx }
  if 'mongodb' in $yum::extrarepo and $osver[0] != '4' { contain yum::repo::mongodb }
  if 'repoforge' in $yum::extrarepo { contain yum::repo::repoforge }
  if 'repoforgeextras' in $yum::extrarepo { contain yum::repo::repoforgeextras }
  if 'integ_ganeti' in $yum::extrarepo { contain yum::repo::integ_ganeti }
  if 'elrepo' in $yum::extrarepo { contain yum::repo::elrepo }
  if 'newrelic' in $yum::extrarepo { contain yum::repo::newrelic }
  if 'mod_pagespeed' in $yum::extrarepo { contain yum::repo::mod_pagespeed }
  if 'jenkins' in $yum::extrarepo { contain yum::repo::jenkins }
  if 'centalt' in $yum::extrarepo { contain yum::repo::centalt }
  if 'elastix' in $yum::extrarepo { contain yum::repo::elastix }
  if 'mysql_community' in $yum::extrarepo { contain yum::repo::mysql_community }
  if 'dell_omsa' in $yum::extrarepo { contain yum::repo::dell_omsa }
  if 'docker' in $yum::extrarepo { contain yum::repo::docker }

  if $yum::bool_defaultrepo {
    case $::operatingsystem {
      centos: {
        if $osver[0] == '7' { contain yum::repo::centos7 }
        if $osver[0] == '6' { contain yum::repo::centos6 }
        if $osver[0] == '5' { contain yum::repo::centos5 }
        if $osver[0] == '4' { contain yum::repo::centos4 }
        if 'centos-testing' in $yum::extrarepo { contain yum::repo::centos_testing }
        if 'karan' in $yum::extrarepo { contain yum::repo::karan }
        if 'atomic' in $yum::extrarepo { contain yum::repo::atomic }
        if 'scl' in $yum::extrarepo { contain yum::repo::scl }
      }
      redhat: {
      }
      scientific: {
        if $osver[0] == '6' { contain yum::repo::sl6 }
        if $osver[0] == '5' { contain yum::repo::sl5 }
        if 'centos-testing' in $yum::extrarepo { contain yum::repo::centos_testing }
        if 'karan' in $yum::extrarepo { contain yum::repo::karan }
      }
      xenserver: {
        contain yum::repo::xenserver
      }
      default: { }
    }
  }
}
