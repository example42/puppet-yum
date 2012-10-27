# = Class: yum::repo::nginx
#
# This class installs the nginx repo
#
class yum::repo::nginx {

  yum::managed_yumrepo { 'nginx':
    descr => 'Nginx official release packages',
    baseurl => 'http://nginx.org/packages/rhel/$releasever/$basearch/',
    enabled => 1,
    gpgcheck => 0,
    priority => 1,
  }

}
