# = Class: yum::repo::webtatic
#
# This class installs the webtatic repo
#
class yum::repo::webtatic {
  $osver = split($::operatingsystemrelease, '[.]')
  $mirrorlist = "https://mirror.webtatic.com/yum/el${osver[0]}/\$basearch/mirrorlist"
  $gpgkey = $osver[0] ? {
    '7'     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-webtatic-el7',
    default => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-webtatic-andy',
  }
  $gpgkey_source = $osver[0] ? {
    '7'     => 'puppet:///modules/yum/rpm-gpg/RPM-GPG-KEY-webtatic-el7',
    default => 'puppet:///modules/yum/rpm-gpg/RPM-GPG-KEY-webtatic-andy',
  }

  yum::managed_yumrepo { 'webtatic':
    descr         => 'Webtatic Repository $releasever - $basearch',
    mirrorlist    => $mirrorlist,
    enabled       => 1,
    gpgcheck      => 1,
    gpgkey        => $gpgkey,
    gpgkey_source => $gpgkey_source,
    priority      => 1,
  }
}
