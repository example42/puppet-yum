# = Class: yum::repo::logstash15
#
# This class installs the logstash15 repo
#
class yum::repo::logstash15 (
  $baseurl = 'http://packages.elasticsearch.org/logstash/1.5/centos',
) {

  yum::managed_yumrepo { 'logstash-1.5':
    descr         => 'logstash repository for 1.5.x packages',
    baseurl       => $baseurl,
    enabled       => 1,
    gpgcheck      => 1,
    gpgkey        => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-elasticsearch',
    gpgkey_source => 'puppet:///modules/yum/rpm-gpg/RPM-GPG-KEY-elasticsearch',
  }

}
