# https://collectd.org/wiki/index.php/Plugin:Write_HTTP
class collectd_plugin::write_http (
  $ensure     = present,
  $interval   = undef,
  $urls  = {},
) {

  validate_hash($urls)

  collectd::plugin {'write_http':
    ensure   => $ensure,
    content  => template('collectd_plugins/plugin/write_http.conf.erb'),
    interval => $interval,
  }
}
