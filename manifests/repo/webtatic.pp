# = Class: yum::repo::webtatic
#
# This class installs the webtatic repo
#
class yum::repo::webtatic {
  yum::managed_yumrepo { 'webtatic':
    descr       => 'Webtatic Repository $releasever - $basearch',
    mirrorlist  => $yum::osver[0] ? {
      5 => 'http://repo.webtatic.com/yum/centos/5/$basearch/debug/mirrorlist',
      6 => 'http://repo.webtatic.com/yum/el6/$basearch/debug/mirrorlist',
    },
    enabled     => 1,
    gpgcheck    => 1,
    gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-webtatic-andy',
    priority    => 1,
  }
}
