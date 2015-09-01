define collectd_plugin::processes::processmatch (
  $regex,
  $ensure    = 'present',
  $matchname = $name
){

  include collectd_plugin::processes

  $conf_dir = getparam(Class['collectd'], 'plugin_conf_dir')

  concat::fragment{"collectd_plugin_processes_conf_processmatch_${matchname}":
    ensure  => $ensure,
    order   => '51',
    content => "ProcessMatch \"${matchname}\" \"${regex}\"\n",
    target  => "${conf_dir}/processes-config.conf"
  }

}
