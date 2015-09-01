define collectd_plugin::processes::process (
  $process   = $name,
  $ensure    = 'present'
){

  include collectd_plugin::processes

  $conf_dir = getparam(Class['collectd'], 'plugin_conf_dir')

  concat::fragment{"collectd_plugin_processes_conf_process_${process}":
    ensure  => $ensure,
    order   => '50',
    content => "Process \"${process}\"\n",
    target  => "${conf_dir}/processes-config.conf"
  }

}
