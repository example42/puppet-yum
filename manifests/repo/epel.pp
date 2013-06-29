# = Class: yum::repo::epel
#
# This class installs the epel repo
#
class yum::repo::epel {

  $osver = split($::operatingsystemrelease, '[.]')

  yum::managed_yumrepo { 'epel':
    descr          => "Extra Packages for Enterprise Linux ${osver[0]} - \$basearch",
    mirrorlist     => "http://mirrors.fedoraproject.org/mirrorlist?repo=epel-${osver[0]}&arch=\$basearch",
    enabled        => 1,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${osver[0]}",
    gpgkey_source  => "puppet:///modules/yum/rpm-gpg/RPM-GPG-KEY-EPEL-${osver[0]}",
    priority       => 16,
  }

  yum::managed_yumrepo { 'epel-debuginfo':
    descr          => "Extra Packages for Enterprise Linux ${osver[0]} - \$basearch - Debug",
    mirrorlist     => "http://mirrors.fedoraproject.org/mirrorlist?repo=epel-${osver[0]}&arch=\$basearch",
    enabled        => 0,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${osver[0]}",
    priority       => 16,
  }

  yum::managed_yumrepo { 'epel-source':
    descr          => "Extra Packages for Enterprise Linux ${osver[0]} - \$basearch - Source",
    mirrorlist     => "http://mirrors.fedoraproject.org/mirrorlist?repo=epel-source-${osver[0]}&arch=\$basearch",
    enabled        => 0,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${osver[0]}",
    priority       => 16,
  }

  yum::managed_yumrepo { 'epel-testing':
    descr          => "Extra Packages for Enterprise Linux ${osver[0]} - Testing - \$basearch",
    mirrorlist     => "http://mirrors.fedoraproject.org/mirrorlist?repo=testing-epel${osver[0]}&arch=\$basearch",
    enabled        => 0,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${osver[0]}",
    priority       => 17,
  }

  yum::managed_yumrepo { 'epel-testing-debuginfo':
    descr          => "Extra Packages for Enterprise Linux ${osver[0]} - Testing - \$basearch - Debug",
    mirrorlist     => "http://mirrors.fedoraproject.org/mirrorlist?repo=testing-debug-epel${osver[0]}&arch=\$basearch",
    enabled        => 0,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${osver[0]}",
    priority       => 17,
  }

  yum::managed_yumrepo { 'epel-testing-source':
    descr          => "Extra Packages for Enterprise Linux ${osver[0]} - Testing - \$basearch - Source",
    mirrorlist     => "http://mirrors.fedoraproject.org/mirrorlist?repo=testing-source-epel${osver[0]}&arch=\$basearch",
    enabled        => 0,
    gpgcheck       => 1,
    failovermethod => priority,
    gpgkey         => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${osver[0]}",
    priority       => 17,
  }

}

