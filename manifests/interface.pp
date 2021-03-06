# https://collectd.org/wiki/index.php/Plugin:Interface
class collectd_plugin::interface (
  $ensure         = present,
  $interfaces     = [],
  $ignoreselected = false,
  $interval       = undef,
) {

  validate_array($interfaces)
  validate_bool($ignoreselected)

  collectd::plugin {'interface':
    ensure   => $ensure,
    content  => template('collectd_plugins/plugin/interface.conf.erb'),
    interval => $interval,
  }
}
