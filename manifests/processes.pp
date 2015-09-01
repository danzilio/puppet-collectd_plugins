# See http://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_processes
class collectd_plugin::processes (
  $ensure          = present,
  $order           = 10,
  $interval        = undef,
  $processes       = undef,
  $process_matches = undef,
) {

  $conf_dir = getparam(Class['collectd'], 'plugin_conf_dir')
  $root_group = getparam(Class['collectd'], 'root_group')

  if $processes { validate_array($processes) }
  if $process_matches { validate_array($process_matches) }

  collectd::plugin {'processes':
    ensure   => $ensure,
    order    => $order,
    interval => $interval,
  }

  concat{"${conf_dir}/processes-config.conf":
    ensure         => $ensure,
    mode           => '0640',
    owner          => 'root',
    group          => $root_group,
    notify         => Service['collectd'],
    ensure_newline => true,
  }
  concat::fragment{'collectd_plugin_processes_conf_header':
    ensure  => $ensure,
    order   => '00',
    content => '<Plugin processes>',
    target  => "${conf_dir}/processes-config.conf",
  }
  concat::fragment{'collectd_plugin_processes_conf_footer':
    ensure  => $ensure,
    order   => '99',
    content => '</Plugin>',
    target  => "${conf_dir}/processes-config.conf",
  }


  if $processes {
    collectd_plugin::processes::process { $processes : }
  }
  if $process_matches {
    $process_matches_resources = collectd_convert_processmatch($process_matches)
    $defaults = { 'ensure' => $ensure }
    create_resources(
      collectd_plugin::processes::processmatch,
      $process_matches_resources,
      $defaults
    )
  }

}
