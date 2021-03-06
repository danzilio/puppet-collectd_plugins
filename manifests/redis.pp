# https://collectd.org/wiki/index.php/Plugin:Redis
class collectd_plugin::redis (
  $ensure      = 'present',
  $interval    = undef,
  $nodes       = { 'redis' => {
      'host'    => 'localhost',
      'port'    => '6379',
      'timeout' => 2000,
    }
  },
) {

  validate_hash($nodes)

  collectd::plugin {'redis':
    ensure   => $ensure,
    content  => template('collectd_plugins/plugin/redis.conf.erb'),
    interval => $interval,
  }
}
