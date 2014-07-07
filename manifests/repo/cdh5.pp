class yum::repo::cdh5 (
  $baseurl = 'http://archive.cloudera.com/cdh5/redhat/6/x86_64/cdh/5/'
) {

  yum::managed_yumrepo { 'cloudera-cdh5':
    descr          => "Cloudera's Distribution for Hadoop, Version 5",
    baseurl        => $baseurl,
    enabled        => 1,
    gpgcheck       => 1,
    gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-cloudera',
    gpgkey_source  => 'puppet:///modules/yum/rpm-gpg/RPM-GPG-KEY-cloudera',
    priority       => 20,
    failovermethod => 'priority',
  }
}
