# https://collectd.org/wiki/index.php/Plugin:vmem
class collectd_plugin::vmem (
  $ensure   = present,
  $interval = undef,
  $verbose  = false,
) {
  collectd::plugin {'vmem':
    ensure   => $ensure,
    content  => template('collectd_plugins/plugin/vmem.conf.erb'),
    interval => $interval,
  }
}
