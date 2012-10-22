class yum::params  {

  $update = false

  $extrarepo = 'epel'

  $clean_repos = false

  $plugins_config_dir = '/etc/yum/pluginconf.d'

  $source_repo_dir = ''

  $repo_dir = '/etc/yum.repos.d'
  
  $config_dir = '/etc/yum'

  $config_file = '/etc/yum.conf'

  $config_file_mode = '0644'

  $config_file_owner = 'root'

  $config_file_group = 'root'

  $log_file = '/var/log/yum.log'

  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = ''
  $options = ''
  $absent = false
  $disable = false
  $disableboot = false
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false

}
