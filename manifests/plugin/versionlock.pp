# = Class yum::plugin::versionlock
#
#
class yum::plugin::versionlock ($ensure = present) {

  package {
    'yum-plugin-versionlock':
      ensure => $ensure
  }
}
