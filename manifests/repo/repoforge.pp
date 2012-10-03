# = Class: yum::repo::repoforge
#
# This class installs the repoforge repo
#
class yum::repo::repoforge {

  yum::managed_yumrepo { 'repoforge':
    descr    => 'RepoForge packages',
    baseurl  => 'http://wftp.tu-chemnitz.de/pub/linux/dag/redhat/el$releasever/en/$basearch/dag',
    enabled  => 1,
    gpgcheck => 1,
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag',
    priority => 30,
  }

}
