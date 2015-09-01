# https://collectd.org/wiki/index.php/Plugin:CSV
class collectd_plugin::csv (
  $ensure     = present,
  $datadir    = '/etc/collectd_plugins/var/lib/collectd_plugins/csv',
  $interval   = undef,
  $storerates = false
) {

  collectd::plugin {'csv':
    ensure   => $ensure,
    content  => template('collectd_plugins/plugin/csv.conf.erb'),
    interval => $interval,
  }
}
