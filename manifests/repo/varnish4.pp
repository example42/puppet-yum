# = Class: yum::repo::varnish
#
# This class installs the varnish 4.0 repo
#
class yum::repo::varnish4 {

  yum::managed_yumrepo { 'varnish':
    descr          => 'Varnish 4.0 for Enterprise Linux $releasever - $basearch',
    baseurl        => 'http://repo.varnish-cache.org/redhat/varnish-4.0/$releasever/$basearch',
    enabled        => 1,
    gpgcheck       => 0,
    failovermethod => 'priority',
    # gpgkey       => 'http://yum.theforeman.org/RPM-GPG-KEY-VARNISH',
    priority       => 26,
  }

}
