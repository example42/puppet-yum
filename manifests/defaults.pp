# = Class: yum::defaults
#
# This class manages default yum repositories for RedHat based distros:
# RHEL, Centos, Scientific Linux
#
class yum::defaults ( ) inherits yum::params {

  $osver = split($::operatingsystemrelease, '[.]')

  if $yum::extrarepo =~ /epel/ { include yum::repo::epel }
  if $yum::extrarepo =~ /rpmforge/ { include yum::repo::rpmforge }
  if $yum::extrarepo =~ /jpackage5/ { include yum::repo::jpackage5 }
  if $yum::extrarepo =~ /jpackage6/ { include yum::repo::jpackage6 }
  if $yum::extrarepo =~ /remi/ { include yum::repo::remi }
  if $yum::extrarepo =~ /tmz/ and $osver[0] != "4" { include yum::repo::tmz }
  if $yum::extrarepo =~ /webtatic/ { include yum::repo::webtatic }
  if $yum::extrarepo =~ /puppetlabs/ and $osver[0] != "4" { include yum::repo::puppetlabs }
  if $yum::extrarepo =~ /puppetdevel/ and $osver[0] != "4" { include yum::repo::puppetdevel }
  if $yum::extrarepo =~ /nginx/ and $osver[0] != "4" { include yum::repo::nginx }
  if $yum::extrarepo =~ /mongodb/ and $osver[0] != "4" { include yum::repo::mongodb }

  case $operatingsystem {

    centos: {
      if $osver[0] == "6" { include yum::repo::centos6 }
      if $osver[0] == "5" { include yum::repo::centos5 }
      if $osver[0] == "4" { include yum::repo::centos4 }
      if $yum::extrarepo =~ /centos-testing/ { include yum::repo::centos_testing }
      if $yum::extrarepo =~ /karan/ { include yum::repo::karan }
    }

    redhat: {
    }

    scientific: {
      include yum::repo::sl
      if $yum::extrarepo =~ /centos-testing/ { include yum::repo::centos_testing }
      if $yum::extrarepo =~ /karan/ { include yum::repo::karan }
    }

    default: { }

  }

}
