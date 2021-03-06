# https://collectd.org/wiki/index.php/Plugin:memcached
class collectd_plugin::memcached (
  $ensure   = present,
  $host     = '127.0.0.1',
  $interval = undef,
  $port     = 11211,
) {
  collectd::plugin {'memcached':
    ensure   => $ensure,
    content  => template('collectd_plugins/plugin/memcached.conf.erb'),
    interval => $interval,
  }
}
