# See http://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_exec
class collectd_plugin::exec (
  $commands          = {},
  $interval          = undef,
  $ensure            = present,
  $globals           = false,
) {

  validate_hash($commands)
  validate_bool($globals)

  collectd::plugin {'exec':
    ensure   => $ensure,
    globals  => $globals,
    interval => $interval,
  }

  $conf_dir = getparam(Class['collectd'], 'plugin_conf_dir')
  $root_group = getparam(Class['collectd'], 'root_group')

  # should be loaded after global plugin configuration
  $exec_conf = "${conf_dir}/exec-config.conf"

  concat{ $exec_conf:
    ensure         => $ensure,
    mode           => '0640',
    owner          => 'root',
    group          => $root_group,
    notify         => Class['collectd::service'],
    ensure_newline => true,
  }

  concat::fragment{'collectd_plugin_exec_conf_header':
    order   => '00',
    content => '<Plugin exec>',
    target  => $exec_conf,
  }

  concat::fragment{'collectd_plugin_exec_conf_footer':
    order   => '99',
    content => '</Plugin>',
    target  => $exec_conf,
  }

  create_resources(collectd_plugin::exec::cmd, $commands)
}
