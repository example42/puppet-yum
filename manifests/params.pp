class yum::params  {

  $update = false

  $extrarepo = 'epel'

  $clean_repos = false

  $packagename_yumpriority = $yum::osver ? {
    5       => 'yum-priorities',
    6       => 'yum-plugin-priorities',
    default => 'yum-plugin-priorities',
  }

}
