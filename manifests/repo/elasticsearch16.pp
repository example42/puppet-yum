# = Class: yum::repo::elasticsearch16
#
# This class installs the elasticsearch16 repo
#
class yum::repo::elasticsearch16 (
  $baseurl = 'http://packages.elasticsearch.org/elasticsearch/1.6/centos',
) {

  yum::managed_yumrepo { 'elasticsearch-1.6':
    descr         => 'Elasticsearch repository for 1.6.x packages',
    baseurl       => $baseurl,
    enabled       => 1,
    gpgcheck      => 1,
    gpgkey        => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-elasticsearch',
    gpgkey_source => 'puppet:///modules/yum/rpm-gpg/RPM-GPG-KEY-elasticsearch',
  }

}
