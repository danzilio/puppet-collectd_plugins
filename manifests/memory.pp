# https://collectd.org/wiki/index.php/Plugin:Memory
class collectd_plugin::memory (
  $ensure           = present,
  $valuesabsolute   = true,
  $valuespercentage = false,
  $interval         = undef,
) {

  validate_bool(
    $valuesabsolute,
    $valuespercentage,
  )

  collectd::plugin {'memory':
    ensure   => $ensure,
    content  => template('collectd_plugins/plugin/memory.conf.erb'),
    interval => $interval,
  }
}
