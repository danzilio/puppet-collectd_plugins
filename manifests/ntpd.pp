# https://collectd.org/wiki/index.php/Plugin:NTPd
class collectd_plugin::ntpd (
  $ensure           = present,
  $host             = 'localhost',
  $port             = 123,
  $reverselookups   = false,
  $includeunitid    = false,
  $interval         = undef,
) {
  collectd::plugin {'ntpd':
    ensure   => $ensure,
    content  => template('collectd_plugins/plugin/ntpd.conf.erb'),
    interval => $interval,
  }
}
