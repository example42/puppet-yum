# = Class: yum::repo::logstash14
#
# This class installs the logstash13 repo
#
class yum::repo::logstash14 {

  yum::managed_yumrepo { 'logstash-1.4':
    descr          => 'logstash repository for 1.4.x packages',
    baseurl        => 'http://packages.elasticsearch.org/logstash/1.4/centos',
    enabled        => 1,
    gpgcheck       => 1,
    gpgkey         => 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch',
  }

}
