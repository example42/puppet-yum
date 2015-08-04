# = Class: yum::repo::elasticsearch15
#
# This class installs the elasticsearch15 repo
#
class yum::repo::elasticsearch15 (
  $baseurl = 'http://packages.elasticsearch.org/elasticsearch/1.5/centos',
) {

  yum::managed_yumrepo { 'elasticsearch-1.5':
    descr         => 'Elasticsearch repository for 1.5.x packages',
    baseurl       => $baseurl,
    enabled       => 1,
    gpgcheck      => 1,
    gpgkey        => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-elasticsearch',
    gpgkey_source => 'puppet:///modules/yum/rpm-gpg/RPM-GPG-KEY-elasticsearch',
  }

}
