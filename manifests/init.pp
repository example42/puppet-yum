# = Class: yum
#
# This class manages yum repositories for RedHat based distros:
# RHEL, Centos, Scientific Linux 
#
# Copyright 2008, admin(at)immerda.ch
# Copyright 2008, Puzzle ITC GmbH
# Marcel Härry haerry+puppet(at)puzzle.ch
# Simon Josi josi+puppet(at)puzzle.ch
#
# This program is free software; you can redistribute
# it and/or modify it under the terms of the GNU
# General Public License version 3 as published by
# the Free Software Foundation.
#
# Apapted for Example42 by Alessandro Franceschi
#
# == Parameters
#
# [*update*]
#   If you want yum automatic updates. Possibile values:
#   cron - Updates in a cronjob
#   updatesd - Updates via updatesd (Only on Centos/RedHat/SL 5)
#   false/no - Automatic updates disabled (Default)
#
# [*extrarepo*]
#   If you want to enable some (supported) extra repositories
#   Can be an array. Default: 'epel'
#   (Epel is used by many modules)
#
# [*clean_repos*]
#   Boolean. Defines if you want to cleanup the yum.repos.d dir
#   and be sure that it contains only files managed by Puppet
#   Default: false
#
# [*packagename_yumpriority*]
#   Name of the yum priority plugin package.
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, yum class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $yum_myclass
#
class yum (
  $update      = params_lookup( 'update' ),
  $extrarepo   = params_lookup( 'extrarepo' ),
  $clean_repos = params_lookup( 'clean_repos' ),
  $packagename_yumpriority = params_lookup( 'packagename_yumpriority' ),
  $my_class    = params_lookup( 'my_class' ),
  ) inherits yum::params {

  $bool_clean_repos=any2bool($clean_repos)

  $osver = split($::operatingsystemrelease, '[.]') 

  if $yum::update == 'cron' { include yum::cron }
  if $yum::update == 'updatesd' and $osver[0] == '5' { include yum::updatesd }
  
  if $yum::extrarepo =~ /epel/ { include yum::repo::epel }
  if $yum::extrarepo =~ /rpmforge/ { include yum::repo::rpmforge }
  if $yum::extrarepo =~ /jpackage/ { include yum::repo::jpackage }
  if $yum::extrarepo =~ /remi/ { include yum::repo::remi }
  if $yum::extrarepo =~ /tmz/ and $osver[0] != "4" { include yum::repo::tmz }
  if $yum::extrarepo =~ /puppetlabs/ and $osver[0] != "4" { include yum::repo::puppetlabs }

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
