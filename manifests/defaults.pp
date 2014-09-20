# = Class: yum::defaults
#
# This class manages default yum repositories for RedHat based distros:
# RHEL, Centos, Scientific Linux
#
class yum::defaults ( ) inherits yum::params {

  $osver = split($::operatingsystemrelease, '[.]')

  define addrepo {
    include "yum::repo::${name}"
  }

  # Include all the repos from the extrarepo configuarion.
  addrepo { $yum::extrarepo: }

  if $yum::bool_defaultrepo {
    case $::operatingsystem {
      centos: {
        if $osver[0] == '6' { include yum::repo::centos6 }
        if $osver[0] == '5' { include yum::repo::centos5 }
        if $osver[0] == '4' { include yum::repo::centos4 }
        if 'centos-testing' in $yum::extrarepo { include yum::repo::centos_testing }
        if 'karan' in $yum::extrarepo { include yum::repo::karan }
        if 'atomic' in $yum::extrarepo { include yum::repo::atomic }
      }
      redhat: {
      }
      scientific: {
        if $osver[0] == '6' { include yum::repo::sl6 }
        if $osver[0] == '5' { include yum::repo::sl5 }
        if 'centos-testing' in $yum::extrarepo { include yum::repo::centos_testing }
        if 'karan' in $yum::extrarepo { include yum::repo::karan }
      }
      xenserver: {
        include yum::repo::xenserver
      }
      default: { }
    }
  }
}
