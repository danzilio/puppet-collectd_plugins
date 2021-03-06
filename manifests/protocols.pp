# See http://collectd.org/documentation/manpages/collectd.conf.5.shtml#plugin_protocols
class collectd_plugin::protocols (
  $ensure           = present,
  $ignoreselected   = false,
  $values            = []
) {

  validate_array(
    $values,
  )
  validate_bool(
    $ignoreselected,
  )

  collectd::plugin {'protocols':
    ensure  => $ensure,
    content => template('collectd_plugins/plugin/protocols.conf.erb'),
  }
}
