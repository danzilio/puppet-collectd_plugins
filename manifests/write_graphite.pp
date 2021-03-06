# https://collectd.org/wiki/index.php/Graphite
class collectd_plugin::write_graphite (
  $carbons           = {},
  $carbon_defaults   = {},
  $interval          = undef,
  $ensure            = present,
  $globals           = false,
) {

  $conf_dir = getparam(Class['collectd'], 'plugin_conf_dir')
  $root_group = getparam(Class['collectd'], 'root_group')

  validate_hash($carbons)

  collectd::plugin {'write_graphite':
    ensure   => $ensure,
    globals  => $globals,
    interval => $interval,
  }

  # should be loaded after global plugin configuration
  $graphite_conf = "${conf_dir}/write_graphite-config.conf"

  concat{ $graphite_conf:
    ensure         => $ensure,
    mode           => '0640',
    owner          => 'root',
    group          => $root_group,
    notify         => Class['collectd::service'],
    ensure_newline => true,
  }

  concat::fragment{'collectd_plugin_write_graphite_conf_header':
    order   => '00',
    content => '<Plugin write_graphite>',
    target  => $graphite_conf,
  }

  concat::fragment{'collectd_plugin_write_graphite_conf_footer':
    order   => '99',
    content => '</Plugin>',
    target  => $graphite_conf,
  }

  create_resources(collectd_plugin::write_graphite::carbon, $carbons, $carbon_defaults)
}
